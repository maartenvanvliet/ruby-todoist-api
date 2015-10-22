module Todoist
  class Note
    include Todoist::Resource
    extend Todoist::Resource::ClassMethods

    define_attributes %w(
      id
      item_id
      posted_uid
      project_id
      content
      is_deleted
      is_archived
      file_attachment
      uids_to_notify
      posted
    )
  end
end