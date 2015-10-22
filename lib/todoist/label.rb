module Todoist
  class Label
    include Todoist::Resource
    extend Todoist::Resource::ClassMethods

    define_attributes %w(
      id
      uid
      name
      color
      item_order
      is_deleted
    )
  end
end