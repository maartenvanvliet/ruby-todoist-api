module Todoist
  class User
    include Todoist::Resource
    extend Todoist::Resource::ClassMethods

    define_attributes %w(
      id
    )
  end
end