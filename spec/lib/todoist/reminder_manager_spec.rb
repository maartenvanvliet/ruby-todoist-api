require "spec_helper"

describe Todoist::ReminderManager do

  let(:client) { Todoist::Client.new("api_token") }
  let(:reminder_manager) { described_class.new(client) }

  describe "creating a reminder" do
    let(:arguments) { {name: 'Label name'} }
    it "can create a reminder" do
      expect{
        reminder_manager.create(arguments)
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.type).to eq 'reminder_add'
      expect(client.queue.last.arguments).to eq arguments
    end

    it "create a reminder with custom tmp id" do
      expect{
        reminder_manager.create(arguments, 'temporary id')
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.temp_id).to eq 'temporary id'
    end
  end
end