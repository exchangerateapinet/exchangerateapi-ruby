# exchangerateapi-ruby

Small Ruby client for exchangerateapi.net with straightforward methods and no external dependencies.

- Website: [exchangerateapi.net](https://exchangerateapi.net)

## Installation

```bash
gem install exchangerateapi-ruby
```

## Quick start

```ruby
require "exchangerateapi/client"
client = Exchangerateapi::Client.new(api_key: "YOUR_API_KEY")
```

## Usage patterns

- Get the newest rates for a base currency; optionally select specific symbols.
- Look up historical rates for a given date and base.

### Configure

You can tweak the base URL and provide your own HTTP timeouts by wrapping calls in `Net::HTTP.start` or using a proxy. The client constructs a query-string request and parses JSON.

### Latest

```ruby
client.latest(base: "USD")
client.latest(base: "EUR", symbols: ["USD", "GBP", "JPY"])
```

### Historical

```ruby
client.historical(date: "2024-01-02", base: "USD")
client.historical(date: "2024-01-02", base: "EUR", symbols: ["USD", "GBP", "JPY"])
```

### Error handling

When the API returns an error payload, the client raises `StandardError` with a short message. Wrap calls with `begin/rescue` to surface user-friendly messages or to retry.

```ruby
begin
  client.latest(base: "XYZ") # invalid base
rescue => e
  warn "request failed: #{e.message}"
end
```

### Run the examples

```bash
EXCHANGERATEAPI_KEY=your_api_key ruby examples/latest.rb
EXCHANGERATEAPI_KEY=your_api_key ruby examples/historical.rb
```

## Free usage

A free tier is available for testing and light workloads. It uses an API key and includes basic access to the latest and historical endpoints with rate limits. Refer to the latest details on [exchangerateapi.net](https://exchangerateapi.net).

## License

MIT
