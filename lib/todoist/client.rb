module Todoist
  class Client
    attr_reader :token, :queue

    def initialize(token)
      @token = token
      clear_queue!
    end

    def base_url
      "https://todoist.com"
    end

    def filters
      @filters ||= FilterManager.new(self)
    end

    def items
      @items ||= ItemManager.new(self)
    end

    def notes
      @notes ||= NoteManager.new(self)
    end

    def projects
      @projects ||= ProjectManager.new(self)
    end

    def reminders
      @reminders ||= ReminderManager.new(self)
    end

    def post(path, payload)
      post_request = Request.post(path, payload.merge(token: token))

      post_request.execute(base_url)
    end

    def sync_path
      "/API/v6/sync"
    end

    def process_queue
      commands = @queue
      clear_queue!
      post(sync_path, { commands: commands.map(&:to_hash).to_json})
    end

    def clear_queue!
      @queue = []
    end

    def add_to_queue(command)
      @queue ||= []
      @queue << command
    end
  end
end