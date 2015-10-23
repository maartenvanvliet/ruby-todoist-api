module Todoist
  module Service
    class BaseService
      attr_writer :command_class
      attr_reader :client
      attr_accessor :data

      def initialize(client)
        @client = client
      end

      def process
        @client.queue.process
      end

      def create_command(name, arguments, tmp_id = nil)
        command_class.new(name, arguments, tmp_id)
      end

      def command_class
        @command_class ||= Command
      end

      def resource_type
        self.class.name.split('::').last.downcase
      end

      def resource_type_plural
        "#{resource_type}s"
      end

      def path
        '/API/v6/sync'
      end

      def seq_no
        data.nil? ? (@seq_no || 0) : client.seq_no
      end

      def seq_no_global
        data.nil? ? 0 : client.seq_no_global
      end

      def retrieve(types = ["all"])
        response = client.post(path, { seq_no: seq_no, seq_no_global: seq_no_global, resource_types: types.to_json })
        @seq_no = response['seq_no'] if response['seq_no']
        response
      end

      def all
        response = retrieve([resource_type_plural])
        self.data = response[resource_type_plural.capitalize].map { |resource| collection_class.new(resource) }
      end

      def create(params, temp_id = nil)
        instance = build(params, temp_id)
        save(instance)
      end

      def build(params, temp_id = nil)
        instance = collection_class.new(params)
        instance.temp_id ||= temp_id
        instance
      end

      def save(instance)
        if instance.persisted?
          @client.queue.add(create_command("#{resource_type}_update", instance))
        else
          instance.temp_id ||= SecureRandom.uuid
          @client.queue.add(create_command("#{resource_type}_add", instance))
        end
        instance
      end
    end
  end
end