require 'json'

module Todoist
  class Request
    attr_accessor :path, :net_http_method

    def initialize(path, net_http_method)
      self.path = path
      self.net_http_method = net_http_method
    end

    def self.post(path, form_data, request_class = Net::HTTP::Post)
      request = request_class.new(path)
      request.set_form_data(form_data)

      new(path, request)
    end

    def execute(base_url)
      uri = URI.parse("#{base_url}#{path}")

      response = http(uri).request(net_http_method)
    end

    def http(uri)
      net = Net::HTTP.new(uri.host, uri.port)
      net.use_ssl = true
      net.verify_mode = OpenSSL::SSL::VERIFY_NONE
      net.read_timeout = 90
      net.open_timeout = 30
      net
    end
  end
end