defmodule GiphyScraper.Fetcher do
  alias GiphyScraper.GiphyImage

  def get_gifs_for_query(query, limit \\ 25) do
    query
    |> get_giphy_request_url(limit)
    |> make_request_and_return_response_data
    |> Enum.map(&parse_response_data_into_image_data/1)
  end

  def get_giphy_request_url(query, limit) do
    "api.giphy.com/v1/gifs/search?api_key=#{api_key()}&q=#{query}&limit=#{limit}"
  end

  def make_request_and_return_response_data(url) do
    HTTPoison.start
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}}
        -> body |> JSON.decode! |> Kernel.get_in(["data"])
      {:ok, %HTTPoison.Response{status_code: _}} -> %{}
      {:error, %HTTPoison.Error{reason: _}} -> %{}
    end
  end

  def parse_response_data_into_image_data(data) do
    title = data["title"]
    url = data["url"]
    username = data["user"]["username"]
    id = data["id"]
    %GiphyImage{
      title: title,
      url: url,
      username: username,
      id: id
    }
  end

  defp api_key, do: System.get_env("GIPHY_API_KEY")
end
