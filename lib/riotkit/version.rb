module Riotkit
  # Current major release.
  # @return [integer]
  MAJOR = 0

  # Current minor release.
  # @return [Integer]
  MINOR = 0

  # Current patch level.
  # @return [Integer]
  PATCH = 0

  # Full release version.
  # @return [String]
  VERSION = [MAJOR, MINOR, PATCH].join('.').freeze
end
