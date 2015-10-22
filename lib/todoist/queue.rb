module Todoist
  class Queue
    extend Forwardable

    def_delegators :@queue, :clear, :first, :last, :shift, :size, :length

    def initialize(client)
      @client = client
    end

    def queue
      @queue ||= []
    end

    def path
      "/API/v6/sync"
    end

    def length
      queue.length
    end

    def process!
      commands = queue
      clear_queue!
      @client.post(path, { commands: commands.map(&:to_hash).to_json})
    end

    def clear_queue!
      @queue = []
    end

    def add(command)
      @queue ||= []
      @queue << command
    end
  end
end