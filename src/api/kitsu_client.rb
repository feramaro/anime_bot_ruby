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
    anime_list = []
    animes.each do |a|
      anime = Anime.new(a["id"], a["attributes"]["titles"]["en"],
                        a["attributes"]["synopsis"], a["attributes"]["description"],
                        a["attributes"]["posterImage"]["large"])
      anime_list.push anime
    end
    anime_list
  end

  def get_anime_by_id(id)
    response = @client.get("/anime/#{id}")
  end

end
