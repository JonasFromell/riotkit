require 'riotkit/configurable'
require 'riotkit/request'
require 'riotkit/client/summoner'

module Riotkit

  class Client
    include Riotkit::Configurable
    include Riotkit::Request
    include Riotkit::Client::Summoner

    def initialize(options={})
      Riotkit::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Riotkit.instance_variable_get(:"@#{key}"))
      end
    end
  end

end
