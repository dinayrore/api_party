# better known as the Pokemon Storage System, or Bill's PC
class Pokemon
  def initialize(id)
    @id = id
    @redis = Redis.new
  end

  def check
    if cached?
      load_from_cache
    else
      request_from_api
    end
  end

  def cached?
    @redis.exists(@id)
  end

  def load_from_cache
    @data = JSON.parse(@redis.get(@id))
  end

  def request_from_api
    url = "http://pokeapi.co/api/v2/pokemon/#{@id}"

    @data = HTTParty.get(url).parsed_response

    cache
  end

end
