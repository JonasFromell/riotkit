require 'riotkit/configurable'
require 'riotkit/request'

module Riotkit

  class Client
    include Riotkit::Configurable
    include Riotkit::Request

    def initialize(options={})
      Riotkit::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Riotkit.instance_variable_get(:"@#{key}"))
      end
    end
  end

end
