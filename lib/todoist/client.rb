module Todoist
  class Client
    attr_reader :token, :queue, :_last_response
    attr_writer :seq_no, :seq_no_global
    attr_accessor :errors

    SUCCES_STATUS_CODE = 200

    def initialize(token)
      @token = token
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

    def labels
      @labels ||= Service::Label.new(self)
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

    def query
      @query ||= Query.new(self)
    end

    def queue
      @queue ||= Queue.new(self)
    end

    def seq_no
      @seq_no ||= 0
    end

    def seq_no_global
      @seq_no_global ||= 0
    end

    def logger
      @logger ||= Logger.new($stdout).tap do |log|
        log.progname = 'todoist-api'
      end
    end

    def post(path, payload)
      post_request = Request.post(path, payload.merge(token: token))

      response = @_last_response = post_request.execute(base_url)

      if response.code.to_i != SUCCES_STATUS_CODE
        self.errors = JSON.parse(@_last_response.body.to_s)
        return false
      else
        parsed_response = JSON.parse(response.body)

        self.seq_no_global = parsed_response['seq_no_global'] if parsed_response.is_a?(Hash) && parsed_response['seq_no_global']

        parsed_response
      end
    end

    def process!
      queue.process!
    end

    def process_queue
      logger.warn 'Deprecated process_queue'
      queue.process!
    end

    def add_to_queue(command)
      logger.warn 'Deprecated process_queue'
      queue.add(command)
    end
  end
end