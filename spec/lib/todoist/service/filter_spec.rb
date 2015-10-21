require "spec_helper"

describe Todoist::Service::Filter do

  let(:client) { Todoist::Client.new("api_token") }
  let(:filter_service) { described_class.new(client) }

  describe "creating a filter" do
    let(:arguments) { {name: 'Label name'} }
    it "can create a filter" do
      expect{
        filter_service.create(arguments)
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.type).to eq 'filter_add'
      expect(client.queue.last.arguments).to eq arguments
    end

    it "create a filter with custom tmp id" do
      expect{
        filter_service.create(arguments, 'temporary id')
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.temp_id).to eq 'temporary id'
    end
  end
end