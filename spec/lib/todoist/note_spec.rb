require "spec_helper"

describe Todoist::Note do
  it "can be built from json" do
    instance = described_class.new(json_response('note'))

    expect(instance.attributes).to eq({"id"=>17299568, "item_id"=>33548400, "posted_uid"=>1855589, "project_id"=>128501470, "content"=>"Note", "is_deleted"=>0, "is_archived"=>0, "file_attachment"=>{"file_type"=>"text/plain", "file_name"=>"File1.txt", "file_size"=>1234, "file_url"=>"https://example.com/File1.txt", "upload_state"=>"completed"}, "posted"=>"Wed 01 Oct 2014 14:54:55 +0000"}
    )
  end
end