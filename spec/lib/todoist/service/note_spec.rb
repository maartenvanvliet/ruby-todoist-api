require "spec_helper"

describe Todoist::Service::Note do

  let(:client) { Todoist::Client.new("api_token") }
  let(:note_service) { described_class.new(client) }

  describe "creating a note" do
    let(:arguments) { {name: 'Label name'} }
    it "can create a note" do
      expect{
        note_service.create(arguments)
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.type).to eq 'note_add'
      expect(client.queue.last.arguments).to eq arguments
    end

    it "create a note with custom tmp id" do
      expect{
        note_service.create(arguments, 'temporary id')
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.temp_id).to eq 'temporary id'
    end
  end
end