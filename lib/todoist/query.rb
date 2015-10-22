module Todoist
  class Result
    include Enumerable

    attr_reader :data

    def initialize(result)
      @query = result['query']
      @data = result['data']
    end

    def each(&block)
      data.each do |object|
        block.call(Todoist::Item.new(object))
      end
    end

    def size
      data.size
    end

  end
  class Query
    def initialize(client)
      @client = client
    end

    def query_path
      '/API/v6/query'
    end

    def search(queries)
      if queries.is_a?(String)
        queries = [queries]
      end

      parsed_response = @client.post(query_path, { queries: queries.to_json})

      result_set = parsed_response.inject({}) do |results, query|
        results[query['query']] = Todoist::Result.new(query)
        results
      end
      result_set
    end
  end


end