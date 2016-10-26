# better known as Bill's PC
class PokemonStorage
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

end
