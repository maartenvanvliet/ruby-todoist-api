require "spec_helper"

describe Todoist::Label do


  it "can be built from json" do
    instance = described_class.new(json_response('label'))

    expect(instance.attributes).to eq({"id"=>790748, "uid"=>1855589, "name"=>"Label1", "color"=>7, "item_order"=>0, "is_deleted"=>0}
    )
  end
end