defmodule Commandline.CLI do
  alias GiphyScraper
  def main(args) do
    options = [switches: [query: :string], aliases: [q: :query]]
    {opts, _, _} = OptionParser.parse(args, options)
    results = GiphyScraper.search(opts[:query])
    IO.inspect results
  end
end
