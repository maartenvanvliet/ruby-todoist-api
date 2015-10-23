module Todoist
  class Command
    attr_accessor :type, :object, :temp_id, :uuid

    def initialize(type, object, temp_id = nil, uuid = nil)
      @type = type
      @object = object
      @temp_id = object.temp_id
      @uuid = uuid || SecureRandom.uuid
    end

    def arguments
      object.to_submittable_hash
    end

    def to_hash
      {
        type: type,
        uuid: uuid,
        args: object.to_submittable_hash
      }.merge(temp_id ? { temp_id: temp_id} : {})
    end
  end
end