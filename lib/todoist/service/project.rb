module Todoist
  module Service
    class Project < BaseService
      def collection_class
        Todoist::Project
      end
    end
  end
end
