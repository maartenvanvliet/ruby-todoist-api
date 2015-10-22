module Todoist
  module Resource
    module ClassMethods
      attr_reader :attributes, :read_only_attributes

      def define_attributes(attributes)
        attr_accessor(*@attributes = attributes)
      end

      def define_read_only_attributes(attributes)
        @read_only_attributes = attributes
      end
    end

    attr_accessor :temp_id

    def initialize(attributes={})
      self.attributes = attributes || {}
    end

    def attributes
      self.class.attributes.inject({}) do |attributes, attribute|
        value = send(attribute)
        if !value.nil?
          attributes[attribute] = value
        end; attributes
      end
    end

    def attributes=(attributes)
      attributes.each do |attribute, value|
        if respond_to?(writer = attribute.to_s + '=')
          send(writer, value)
        else
          puts "#{self.class} does not have an `#{attribute}' attribute"
        end
      end
    end

    def to_submittable_hash
      if self.class.read_only_attributes
        attributes.delete_if { |key, value| self.class.read_only_attributes.include?(key)}
      else
        attributes
      end
    end
  end
end