defmodule GiphyScraper.Fetcher do
  alias GiphyScraper.GiphyImage

  def get_gifs_for_query(query, limit \\ 25) do
    query
    |> get_giphy_request_url(limit)
    |> make_request_and_return_response_data
    |> Enum.map(&parse_response_data_into_image_data/1)
  end

  def get_giphy_request_url(query, limit) do
    api_key = get_api_key()
    "api.giphy.com/v1/gifs/search?api_key=#{api_key}&q=#{query}&limit=#{limit}"
  end

  def make_request_and_return_response_data(url) do
    HTTPoison.start
    {:ok, response} = HTTPoison.get(url)
    body = response.body |> JSON.decode!
    body["data"]
  end

  def parse_response_data_into_image_data(data) do
    title = get_in(data, ["title"])
    url = get_in(data, ["url"])
    username = get_in(data, ["user", "username"])
    id = get_in(data, ["id"])
    %GiphyImage{
      title: title,
      url: url,
      username: username,
      id: id
    }
  end

  defp get_api_key, do: System.get_env("GIPHY_API_KEY")
end
