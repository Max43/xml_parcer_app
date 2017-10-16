module Mappable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def parse(url, &block)
      root_node = Node.new url: url
      root_node.instance_eval(&block) if block_given?
      binding.pry
    end
  end

  class Node
    def initialize(params = {})
      @url = params[:url]
      @name = params[:name]
      @model = params[:model]
      @nodes = []
      @attributes = []
    end

    attr_reader :name, :model, :nodes, :attributes

    def configuration
      @nodes.inject({}) { |mem, node| mem.merge!(node.to_hash) }
    end

    def to_hash
      base = {
        name.to_s.upcase => {
          model:      model,
          attributes: attributes
        }
      }

      if nodes.any?
        base[name.to_s.upcase].merge!(nodes: nodes.map { |nod| nod.to_hash })
      end

      return base
    end

    def node(name:, model:, &block)
      tmp_node = Node.new(name: name, model: model)
      @nodes << tmp_node
      tmp_node.instance_eval(&block) if block_given?
    end

    def link(element:, to:)n
      @attributes << { element => to }
    end
  end
end
