defmodule GiphyScraper do
  alias GiphyScraper.Fetcher
  defdelegate search(query), to: Fetcher, as: :get_gifs_for_query
end
