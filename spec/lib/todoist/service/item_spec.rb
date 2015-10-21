require "spec_helper"

describe Todoist::Service::Item do

  let(:client) { Todoist::Client.new("api_token") }
  let(:item_service) { described_class.new(client) }

  describe "creating an item" do
    let(:arguments) { {content: 'Todo item content'} }
    it "can create an item" do
      expect{
        item_service.create(arguments)
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.type).to eq 'item_add'
      expect(client.queue.last.arguments).to eq arguments
    end

    it "create an item with custom tmp id" do
      expect{
        item_service.create(arguments, 'temporary id')
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.temp_id).to eq 'temporary id'
    end
  end
end