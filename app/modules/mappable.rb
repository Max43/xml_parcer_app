module Mappable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def representation; @root; end


    def map(params = {}, &block)
      @root = Node.new(params)
      @root.instance_eval(&block) if block_given?
    end
  end
end
