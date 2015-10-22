module Todoist
  class Item
    include Todoist::Resource
    extend Todoist::Resource::ClassMethods

    define_attributes %w(
      id
      user_id
      project_id
      content
      date_string
      date_lang
      priority
      indent
      item_order
      day_order
      collapsed
      children
      labels
      assigned_by_uid
      responsible_uid
      checked
      in_history
      is_deleted
      is_archived
      sync_id
      due_date_utc
      due_date
      date_added
      postpone_count
      complete_count
      mm_offset
      seq_no
    )

    define_read_only_attributes %w(
      postpone_count
      complete_count
      mm_offset
      seq_no
    )
  end
end
