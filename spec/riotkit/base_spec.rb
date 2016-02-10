require 'helper'

describe Riotkit do
  before do
    Riotkit.reset!
  end

  after do
    Riotkit.reset!
  end

  describe ".configure" do
    Riotkit::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        Riotkit.configure do |config|
          config.send("#{key}=", key)
        end
      end
    end
  end
end
