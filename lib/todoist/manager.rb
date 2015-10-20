module Todoist
  class Manager
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
      self.class.name.split('::').last.gsub('Manager','').downcase
    end

    def resource_type_add
      "#{resource_type}_add"
    end

    def create(arguments, tmp_id = SecureRandom.uuid)
      @client.add_to_queue(create_command(resource_type_add, arguments, tmp_id))
    end
  end
end