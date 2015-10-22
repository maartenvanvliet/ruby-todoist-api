module Todoist
  module Service
    class Note < BaseService
      def collection_class
        Todoist::Note
      end
    end
  end
end
