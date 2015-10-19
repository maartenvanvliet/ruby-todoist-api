module Todoist
  class Command
    attr_accessor :type, :arguments, :temp_id, :uuid

    def initialize(type, arguments, temp_id = nil, uuid = nil)
      @type = type
      @arguments = arguments
      @temp_id = temp_id
      @uuid = uuid || SecureRandom.uuid
    end

    def to_hash
      {
        type: type,
        temp_id: temp_id,
        uuid: uuid,
        args: arguments
      }.merge(temp_id ? { temp_id: temp_id} : {})
    end
  end
end