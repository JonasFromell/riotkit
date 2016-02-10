module Riotkit

  module Defaults

    class << self
      def options
        Hash[Riotkit::Configurable.keys.map{ |key| [key, send(key)] }]
      end

      # Default access token is grabbed from ENV
      # @return [String]
      def access_token
        ENV['RIOT_API_ACCESS_TOKEN']
      end
    end

  end
end
