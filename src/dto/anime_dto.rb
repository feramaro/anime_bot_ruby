class Anime
  attr_accessor :id, :name, :synopsis, :description, :poster
  def initialize(anime_json)
    @id = anime_json["id"]
    @name = anime_json["attributes"]["titles"]["en"]
    @synopsis = anime_json["attributes"]["synopsis"]
    @description = anime_json["attributes"]["description"]
    @poster = anime_json["attributes"]["posterImage"]["large"]
  end
end
