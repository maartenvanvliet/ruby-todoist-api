module Todoist
  module Service
    class Label < BaseService
      def collection_class
        Todoist::Label
      end
    end
  end
end
