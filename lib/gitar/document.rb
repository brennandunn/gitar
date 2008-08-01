module Gitar
  module Document
    module ClassMethods
      
    end
    
    module InstanceMethods
      
      def __uuid__
        @__uuid__ ||= UUID.new
      end
      
      def id
        "#{self.class.name}@#{__uuid__}"
      end
      
      def new_document?
        @new_document
      end
      alias :new_record? :new_document?  # for rails compatability
      
      def attributes
        @attributes
      end
      
      def attributes=(attribs = {})
        attribs.each do |met, value|
          send("#{met.to_sym}=", value)
        end
      end
      
    end
    
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end