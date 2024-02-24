require "http"

class HttpClient
  attr_accessor :base_url

  def initialize(base_url)
    @base_url = base_url
  end

  def get(path)
    HTTP.get("#{@base_url}#{path}")
  end

end
