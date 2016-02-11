require 'riotkit/client'
require 'riotkit/configurable'
require 'riotkit/defaults'

module Riotkit

  class << self
    include Riotkit::Configurable
  end

end

Riotkit.setup
