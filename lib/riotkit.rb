require 'riotkit/client'
require 'riotkit/configurable'
require 'riotkit/defaults'

module Riotkit

  class << self
    include Riotkit::Configurable

    # API client using configured options {Configurable}
    # @return [Riotkit::Client] API wrapper
    def client
      @client ||= Riotkit::Client.new(options)
    end
  end

end

Riotkit.setup
