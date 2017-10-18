module Mappable
  class Node
    def initialize(params = {})
      @xpath    = xml_name(params[:xpath])
      @model    = params[:model]
      @relation = params[:relation]
      @via      = params[:via]
    end

    def node(params = {}, &block)
      child = self.class.new(params)
      children << child

      child.instance_eval(&block) if block_given?
    end

    def link(attribute:, column: attribute)
      mapping[xml_name(attribute)] = column
    end

    def children
      @children ||= []
    end

    def mapping
      @mapping ||= {}
    end

    def skip?
      model.nil? && relation.nil?
    end

    attr_reader :model, :xpath, :skip, :relation, :via

    private

    def xml_name(xpath)
      xpath.to_s.upcase
    end
  end
end
