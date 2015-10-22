module Todoist
  module Service
    class Reminder < BaseService
      def collection_class
        Todoist::Reminder
      end
    end
  end
end
