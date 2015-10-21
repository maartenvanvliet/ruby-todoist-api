require "spec_helper"

describe Todoist::Service::Project do

  let(:client) { Todoist::Client.new("api_token") }
  let(:project_service) { described_class.new(client) }

  describe "creating a project" do
    let(:arguments) { {name: 'Project name'} }
    it "can create an project" do
      expect{
        project_service.create(arguments)
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.type).to eq 'project_add'
      expect(client.queue.last.arguments).to eq arguments
    end

    it "can create an project with custom tmp id" do
      expect{
        project_service.create(arguments, 'temporary id')
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.temp_id).to eq 'temporary id'
    end
  end
end