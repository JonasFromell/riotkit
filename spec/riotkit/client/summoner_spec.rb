require 'helper'

describe Riotkit::Client::Summoner do

  before do
    Riotkit.reset!
  end

  after do
    Riotkit.reset!
  end

  describe ".summoner" do
    before do
      Riotkit.configure do |config|
        config.access_token = "87614b09dd141c22800f96f11737ade5226d7ba8"
      end
    end

    it "returns the summoner details" do
      req = stub_request(:get, "https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/hatkee").with(query: { api_key: Riotkit.access_token }).to_return(body: "{}")
      Riotkit.client.summoner("hatkee")

      assert_requested req
    end
  end

end
