module Todoist
  module Service
    class Filter < BaseService
      def collection_class
        Todoist::Filter
      end
    end
  end
end
