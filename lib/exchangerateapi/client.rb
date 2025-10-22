# frozen_string_literal: true

require "net/http"
require "json"
require "uri"

module Exchangerateapi
  class Client
    DEFAULT_BASE = "https://api.exchangerateapi.net/v1"

    def initialize(api_key:, base_url: DEFAULT_BASE)
      raise ArgumentError, "api_key is required" if api_key.to_s.strip.empty?
      @api_key = api_key
      @base_url = base_url.chomp("/")
    end

    def latest(base:, symbols: nil)
      raise ArgumentError, "base is required" if base.to_s.strip.empty?
      params = { base: base, apikey: @api_key }
      params[:symbols] = Array(symbols).join(",") if symbols && !Array(symbols).empty?
      get_json("/latest", params)
    end

    def historical(date:, base:, symbols: nil)
      raise ArgumentError, "date is required" if date.to_s.strip.empty?
      raise ArgumentError, "base is required" if base.to_s.strip.empty?
      params = { date: date, base: base, apikey: @api_key }
      params[:symbols] = Array(symbols).join(",") if symbols && !Array(symbols).empty?
      get_json("/historical", params)
    end

    private

    def get_json(path, params)
      uri = URI.parse(@base_url + path)
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      body = JSON.parse(res.body)
      if body.is_a?(Hash) && body["error"]
        msg = body["error"]["message"] rescue "API error"
        raise StandardError, msg
      end
      body
    end
  end
end
