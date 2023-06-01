# GiphyScraper

## Running this project:
1. Export your Giphy API key as an environment variable with the name of `GIPHY_API_KEY`
2. Run `mix deps.get` to obtain any necessary dependencies
3. Run `iex` using `mix`
4. Run `GiphyScraper.search("<your term here>")`, with whatever term you prefer


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `giphy_scraper` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:giphy_scraper, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/giphy_scraper>.

