require 'faraday'

module Riotkit

  module Request

    def get(url, params={})
      connection.get url, params
    end

    def connection
      @connection ||= Faraday.new(endpoint) do |http|
        http.adapter Faraday.default_adapter
      end
    end

    private

    def endpoint
      Riotkit.endpoint
    end

  end

end
