module Riotkit

  class Client

    module Summoner
      # Current API version.
      # @return [String]
      VERSION = [1, 4].join('.').freeze

      # Get a single summoner
      # @param name [String] The name of the summoner to fetch
      # @return [Map<string, details>] Summoner details
      # @see https://developer.riotgames.com/api/methods#!/1061/3663
      def summoner(name)
        get "api/lol/#{Riotkit.region}/v#{Summoner::VERSION}/summoner/by-name/#{name}", api_key: "#{Riotkit.api_key}"
      end
    end
  end
end
