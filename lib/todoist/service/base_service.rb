module Todoist
  module Service
    class BaseService
      attr_writer :command_class

      def initialize(client)
        @client = client
      end

      def process
        @client.process_queue
      end

      def create_command(name, arguments, tmp_id = nil)
        command_class.new(name, arguments, tmp_id)
      end

      def command_class
        @command_class ||= Command
      end

      def resource_type
        self.class.name.split('::').last.gsub('Service','').downcase
      end

      def create(params, temp_id = nil)
        instance = collection_class.new(params)
        instance.temp_id ||= temp_id

        @client.add_to_queue(create_command("#{resource_type}_add", instance.to_submittable_hash, temp_id))
        instance
      end
    end
  end
end