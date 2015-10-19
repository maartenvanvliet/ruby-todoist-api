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
  end
end