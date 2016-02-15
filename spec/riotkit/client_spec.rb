require 'helper'

describe Riotkit::Client do

  before do
    Riotkit.reset!
  end

  after do
    Riotkit.reset!
  end

  describe "with module configuration" do
    before do
      Riotkit.reset!
      Riotkit.configure do |config|
        Riotkit::Configurable.keys.each do |key|
          config.send("#{key}=", "Some #{key}")
        end
      end
    end

    after do
      Riotkit.reset!
    end

    it "inherits the modules configuration" do
      client = Riotkit::Client.new
      Riotkit::Configurable.keys.each do |key|
        expect(client.instance_variable_get(:"@#{key}")).to eq("Some #{key}")
      end
    end
  end

  describe "with class level configuration" do
    before do
      @options = {
        :api_key => "87614b09dd141c22800f96f11737ade5226d7ba8"
      }
    end

    it "overrides the module configuration" do
      client = Riotkit::Client.new(@options)
      expect(client.instance_variable_get(:"@api_key")).to eq("87614b09dd141c22800f96f11737ade5226d7ba8")
    end

    it "can set configuration after initialization" do
      client = Riotkit::Client.new
      client.configure do |config|
        @options.each do |key, value|
          config.send("#{key}=", value)
        end
      end

      expect(client.instance_variable_get(:"@api_key")).to eq("87614b09dd141c22800f96f11737ade5226d7ba8")
    end
  end

  describe ".connection" do
    before do
      Riotkit.reset!
    end

    it "caches the connection" do
      connection = Riotkit.client.connection
      expect(connection.object_id).to eq(Riotkit.client.connection.object_id)
    end
  end

  describe ".get" do
    before do
      Riotkit.reset!
    end

    it "handles query params" do
      req = stub_request(:get, "https://euw.api.pvp.net").with(query: { foo: "bar" }).to_return(body: "{}")
      Riotkit.client.get "/", foo: "bar"

      assert_requested req
    end
  end

end
