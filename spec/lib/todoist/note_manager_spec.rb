require "spec_helper"

describe Todoist::NoteManager do

  let(:client) { Todoist::Client.new("api_token") }
  let(:note_manager) { described_class.new(client) }

  describe "creating a note" do
    let(:arguments) { {name: 'Label name'} }
    it "can create a note" do
      expect{
        note_manager.create(arguments)
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.type).to eq 'note_add'
      expect(client.queue.last.arguments).to eq arguments
    end

    it "create a note with custom tmp id" do
      expect{
        note_manager.create(arguments, 'temporary id')
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.temp_id).to eq 'temporary id'
    end
  end
end