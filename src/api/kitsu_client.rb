require "json"
require_relative "http_client"
require_relative "../dto/anime_dto"

class KitsuClient
  def initialize
    @client = HttpClient.new("https://kitsu.io/api/edge")
  end

  def get_trending
    response = @client.get("/trending/anime")
    json = JSON.parse(response)
    animes = json["data"]
    anime_list = animes.map { |anime| Anime.new(anime) }
  end

  def get_anime_by_id(id)
    response = @client.get("/anime/#{id}")
  end
end
