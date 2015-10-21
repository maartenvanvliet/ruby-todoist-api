require "spec_helper"

describe Todoist::Service::Label do

  let(:client) { Todoist::Client.new("api_token") }
  let(:label_service) { described_class.new(client) }

  describe "creating an item" do
    let(:arguments) { {name: 'Label name'} }
    it "can create an item" do
      expect{
        label_service.create(arguments)
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.type).to eq 'label_add'
      expect(client.queue.last.arguments).to eq arguments
    end

    it "create an item with custom tmp id" do
      expect{
        label_service.create(arguments, 'temporary id')
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.temp_id).to eq 'temporary id'
    end
  end
end