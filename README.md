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

### Run the examples

```bash
EXCHANGERATEAPI_KEY=your_api_key ruby examples/latest.rb
EXCHANGERATEAPI_KEY=your_api_key ruby examples/historical.rb
```

## License

MIT
