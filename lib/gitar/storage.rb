module Gitar
  module Storage
    
    class ConflictingUUIDError < StandardError ; end
    
    module ClassMethods
      
    end
    
    module InstanceMethods
      
      def save
        if valid?
          raise ConflictingUUIDError.new if new_document? && File.exists?(document_path)
          if File.exists?(document_path)
            # TODO
            # Overwrite - this objects been remodified - create new commit
          else
            File.open(document_path, 'w') do |f|
              f.write yamlized
            end
            @new_document = false
          end
        end
      end
      
      def yamlized
        attributes.merge!({ :updated_at => Time.now, :__uuid__ => __uuid__ })
        attributes.merge!({ :created_at => Time.now }) if new_document?
        attributes.to_yaml
      end
      
    end
    
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end