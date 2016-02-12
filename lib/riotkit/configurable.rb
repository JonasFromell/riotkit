module Riotkit

  module Configurable
    #@!attribute [w] access_token
    # => @see
    # => @return [String] OAuth2 access token for authentication
    #@!attribute [w] region
    # => @see
    # => @return [String] The API region
    #@!attribute [w] endpoint
    # => @see
    # => @return [String] The constructed API endpoint
    attr_accessor :access_token, :region, :endpoint

    class << self

      # List of configurable keys
      # @return [Array] Array of keys
      def keys
        @keys ||= [
          :access_token,
          :region,
          :endpoint
        ]
      end
    end

    # Sets configuration options in a block
    def configure
      yield self
    end

    # Resets configuration options to defaults
    def reset!
      Riotkit::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Riotkit::Defaults.options[key])
      end
      self
    end
    alias setup reset!

    private

    def options
      Hash[Riotkit::Configurable.keys.map{ |key| [key, instance_variable_get(:"@#{key}")] }]
    end

  end

end
