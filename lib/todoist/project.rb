module Todoist
  class Project
    include Todoist::Resource
    extend Todoist::Resource::ClassMethods

    define_attributes %w(
      id
      user_id
      name
      color
      indent
      item_order
      collapsed
      shared
      is_deleted
      is_archived
      archived_date
      archived_timestamp
      inbox_project
    )

    define_read_only_attributes %w(
      inbox_project
    )

    def items
      @items ||= Service::Item.new(client)
    end


  end
end