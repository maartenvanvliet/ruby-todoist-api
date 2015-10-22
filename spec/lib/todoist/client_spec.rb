require "spec_helper"

describe Todoist::Client do

  let(:client) { described_class.new("api_token") }

  it "sets a api token when given one string argument" do
    expect(client.token).to eq 'api_token'
  end

  it "has a baseurl" do
    expect(client.base_url).to_not be_nil
  end

  describe "request handling" do
    let!(:stub) {
      stub_request(:post, "https://todoist.com/path").
        with(:body => {"payload"=>"payload", "token"=>"api_token"}).
        to_return(:status => 200, :body => '{}')

    }

    it "can post a request" do
      client.post('/path', { payload: 'payload'})

      expect(stub).to have_been_requested
    end
  end


  describe "queue handling" do
    let(:command) { { 'type' => 'test_command'} }
    before do
      client.add_to_queue(command)
    end

    it "can add a command to the queue" do

      expect(client.queue).to eq([command])
    end

    describe "sends the queue in a request" do
      let!(:stub) {
        stub_request(:post, "https://todoist.com/API/v6/sync").
          with(:body => {"commands"=>"[{\"type\":\"test_command\"}]", "token"=>"api_token"}).
          to_return(:status => 200, :body => '{}')

      }

      it "can post a request" do
        client.process_queue

        expect(client.queue.length).to eq 0
        expect(stub).to have_been_requested
      end
    end
  end
end