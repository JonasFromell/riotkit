require 'riotkit/configurable'

module Riotkit

  class Client
    include Riotkit::Configurable

    def initialize(options={})
      Riotkit::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Riotkit.instance_variable_get(:"@#{key}"))
      end
    end
  end

end
