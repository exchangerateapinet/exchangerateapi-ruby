# frozen_string_literal: true

require_relative "../lib/exchangerateapi/client"

api_key = ENV.fetch("EXCHANGERATEAPI_KEY", "YOUR_API_KEY")
client = Exchangerateapi::Client.new(api_key: api_key)

# Scenario A: Historical with base only
hist_usd = client.historical(date: "2024-01-02", base: "USD")
puts "Historical USD sample: #{hist_usd.fetch("rates", {}).keys.first(5)}"

# Scenario B: Historical with symbol filter
hist_eur_subset = client.historical(date: "2024-01-02", base: "EUR", symbols: %w[USD GBP JPY])
puts "Historical EUR subset: #{hist_eur_subset.fetch("rates", {}).slice("USD", "GBP", "JPY")}"
