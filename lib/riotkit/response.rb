require 'json'

module Riotkit

  class Response < Faraday::Response::Middleware

    def call(env)
      @app.call(env).on_complete do |env|
        parse(env[:body])
      end
    end

    def parse(body)
      begin
        json = JSON.parse(body)
      rescue JSON::ParserError => err
        raise Faraday::Error::ParsingError, err
      end
      json
    end

  end

end
