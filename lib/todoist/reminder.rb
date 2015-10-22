module Todoist
  class Reminder
    include Todoist::Resource
    extend Todoist::Resource::ClassMethods

    define_attributes %w(
      id
      user_id
      name
      query
      color
      item_order
      is_deleted
    )
  end
end
