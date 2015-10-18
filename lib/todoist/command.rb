module Todoist
  class Command
    attr_accessor :type, :arguments, :temp_id, :uuid

    def initialize(type, arguments, temp_id = nil, uuid = nil)
      @type = type
      @arguments = arguments
      @temp_id = temp_id || SecureRandom.uuid
      @uuid = uuid || SecureRandom.uuid
    end

    def to_hash
      {
        type: type,
        temp_id: temp_id,
        uuid: uuid,
        args: arguments
      }
    end
  end
end