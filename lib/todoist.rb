require "net/http"
module Todoist

  class ItemList
    def initialize(client)
      @client = client
    end

    def add(options)
      @client.post(Item.new(options))
    end
  end

  class Item
    attr_accessor :content
    def initialize(attrs)
      @content = attrs[:content]
    end

    def args
      {
        content: @content
      }
    end

    def to_hash
      {
        type: "item_add",
        args: args,
        temp_id: '11111111111111',
        uuid: SecureRandom.uuid
      }
    end
  end
end

require 'todoist/client'
require 'todoist/command'
require 'todoist/manager'
require 'todoist/item_manager'
require 'todoist/request'