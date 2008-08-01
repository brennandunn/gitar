module Gitar
  class Base
    include Environment, Document
    
    def initialize(attributes = {})
      create_or_find_default_repository
      @attributes = {}
      @new_document = true
      self.attributes = attributes
    end
    
    def method_missing(method, *args, &block)
      if method.to_s.include?('=')
        @attributes[method.to_s[0...-1].to_sym] = args.first
        return args.first
      end
      raise NoMethodError.new("Undefined method: #{method}")
    end
    
  end
end