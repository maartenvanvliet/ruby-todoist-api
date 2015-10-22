require 'webmock/rspec'
require 'todoist'

require_relative "support/json_response_helper"

RSpec.configure do |config|
  config.include JsonResponseHelper
end