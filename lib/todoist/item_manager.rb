module Todoist
  class Manager
    attr_writer :command_class

    def initialize(client)
      @client = client
    end

    def process
      @client.process_queue
    end

    def create_command(name, arguments)
      command_class.new('item_add', arguments)
    end

    def command_class
      @command_class ||= Command
    end
  end

  class ItemManager < Manager

    def create!(arguments)
      @client.add_to_queue(create_command('item_add', arguments))
      process
    end

    def update(id, arguments)

    end
  end
end