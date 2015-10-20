module Todoist
  class ItemManager < Manager

    def update(id, arguments)
      @client.add_to_queue(create_command('item_update', arguments.merge({id: id})))
    end

    def delete(ids)
      if ids.is_a?(FixNum)
        ids = [ids]
      end
      @client.add_to_queue(create_command('item_delete', {ids: ids}))
    end

    def close(id)
      @client.add_to_queue(create_command('item_close', {id: id}))
    end
  end
end
