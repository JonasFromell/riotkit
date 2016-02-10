# Riotkit

Ruby toolkit for the Riot API

## Quick start

Install via Rubygems

    gem install riotkit

... or add to your Gemfile

    gem "riotkit", "~> 0.0.1"

### Making requests

API methods are available as module methods or as client instance methods.

```ruby
# Provide authentication credentials
Riotkit.configure do |c|
  c.access_token = 'xxxxxxxxxxxxx'
end

# Fetch a summoner
Riotkit.summoner(1)
```
or

```ruby
# Provide authentication credentials
client = Riotkit::Client.new(:access_token => 'xxxxxxxxxxxxx')

# Fetch a summoner
client.summoner(1)
```
