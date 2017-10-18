require 'open-uri'

module Scrapper
  class Persist < ::ApplicationService
    def initialize(params = {})
      @url    = params[:url]
      @schema = params[:schema]
    end

    def call
      @collection ||= build(representation, xml)
      # @collection.each(&:save!) - In case u want to save it
    end

    private

    def build(node, xml_doc, parent = nil)
      inner_xml = xml_doc.xpath ".//#{node.xpath}"

      return next_node(node, inner_xml, parent) if node.skip?

      collection = inner_xml.flat_map do |xml_row|
        # FYI - You can't use model & relation keys in the node definition at the same time
        object = build_model(node, xml_row) if node.model
        object = build_association(node, xml_row, parent) if node.relation && parent

        next_node(node, xml_row, object)

        next object
      end

      return collection
    end

    def next_node(node, xml_doc, parent = nil)
      return parent if node.children.empty?

      node.children.flat_map { |child| build(child, xml_doc, parent) }
    end

    def build_model(node, xml_row)
      node.model.new model_params(node.mapping, xml_row)
    end

    def build_association(node, xml_row, parent)
      if node.via.to_s.inquiry.has_many?
        parent.send(node.relation).new model_params(node.mapping, xml_row)
      else
        association = parent.send("build_#{node.relation}", model_params(node.mapping, xml_row))
      end
    end

    def model_params(mapping, xml_row)
      xml_row.attributes
        .inject({}) { |mem, e| mem.merge!(mapping[e.first] => e.last.value) }
        .reject { |k, v| k.blank? || v.blank? }
    end

    attr_reader :url
    delegate    :representation, to: :schema

    def schema
      @schema || ::Schemas::Default
    end

    def xml
      @xml ||= Nokogiri::XML open(url)
    end
  end
end
