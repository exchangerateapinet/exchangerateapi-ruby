# frozen_string_literal: true

require_relative "../lib/exchangerateapi/client"

api_key = ENV.fetch("EXCHANGERATEAPI_KEY", "YOUR_API_KEY")
client = Exchangerateapi::Client.new(api_key: api_key)

# Scenario A: Latest with base only
latest_usd = client.latest(base: "USD")
puts "Latest USD sample: #{latest_usd.fetch("rates", {}).keys.first(5)}"

# Scenario B: Latest with symbol filter
latest_eur_subset = client.latest(base: "EUR", symbols: %w[USD GBP JPY])
puts "Latest EUR subset: #{latest_eur_subset.fetch("rates", {}).slice("USD", "GBP", "JPY")}"
