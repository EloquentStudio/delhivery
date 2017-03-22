require 'faraday_middleware'
require 'delhivery/faraday/raise_http_errors'
require 'logger'
require 'null_logger'

module Delhivery
  class Connection    
    def initialize(opts)
      @token = opts[:api_key]
      base_url = opts[:production] ? "https://track.delhivery.com/" : "https://test.delhivery.com"
      @logger = ::Logger.new(STDOUT) #opts[:logger] || NullLogger.instance
      @connection = ::Faraday.new(base_url) do |conn|
        conn.response :logger, @logger, bodies: true
        conn.request :json
        conn.response :json, :content_type => /\bjson$/
        conn.use Delhivery::Faraday::Response::RaiseHttpError
        conn.adapter ::Faraday.default_adapter
      end
    end

    def log
      @logger
    end

    def get(route, params={}, headers={})
      params = params.delete_if {|key, value| value.nil? }
      run_request(:get, build_url(route, params), nil, headers)
    end

    def build_url(route, params)
      @connection.build_url(route, params)
    end

    def post(route, body=nil, headers={})
      run_request(:post, route, body, headers)
    end

    def put(route, body=nil, headers={})
      run_request(:put, route, body, headers)
    end

    def delete(route, body=nil, headers={})
      run_request(:delete, route, body, headers)
    end

    def run_request(method, route, body, headers)
      response = {}
        response = @connection.run_request(
          method,
          route,
          body,
          { 'Authorization' => "Token #{@token}" }
        )
      log.debug(response.body)
      response
    end
  end
end
