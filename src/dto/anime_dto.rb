class Anime
  attr_accessor :id, :name, :synopsis, :description, :poster
  def initialize(id, name, synopsis, description, poster)
    @id = id
    @name = name
    @synopsis = synopsis
    @description = description
    @poster = poster
  end
end
