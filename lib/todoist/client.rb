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
      @filters ||= Service::Filter.new(self)
    end

    def items
      @items ||= Service::Item.new(self)
    end

    def notes
      @notes ||= Service::Note.new(self)
    end

    def projects
      @projects ||= Service::Project.new(self)
    end

    def reminders
      @reminders ||= Service::Reminder.new(self)
    end

    def post(path, payload)
      post_request = Request.post(path, payload.merge(token: token))

      response = post_request.execute(base_url)
      JSON.parse(response.body)
    end

    def query
      @query ||= Query.new(self)
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