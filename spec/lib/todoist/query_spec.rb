require "spec_helper"

describe Todoist::Query do

  let(:client) { Todoist::Client.new("api_token") }
  let(:query) { described_class.new(client) }

  describe "creating a query" do
    let(:arguments) { resource_without_id('filter') }

    before do
      stub_request(:post, "https://todoist.com/API/v6/query").
         with(:body => {"queries"=>"[\"tomorrow\",\"p1\"]", "token"=>"api_token"}).
         to_return(:status => 200, :body => json_response_raw('query'), :headers => {})
    end

    it "can create searches" do

      result = query.search(['tomorrow', 'p1'])

      expect(result.keys).to eq ['tomorrow','p1']
      expect(result['tomorrow'].size).to eq 2
      expect(result['tomorrow'].first.id).to eq 35825425
    end
  end
end