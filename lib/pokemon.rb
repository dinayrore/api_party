require 'redis'
require 'httparty'
require 'json'
require 'pry'
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
    @data = JSON.parse(@redis.get(@id), :quirks_mode => true)
  end

  def request_from_api
    url = "http://pokeapi.co/api/v2/pokemon/#{@id}"

    @data = HTTParty.get(url).parsed_response

    cache
  end

  def cache
    @redis.set(@id, JSON.dump(@data))
  end

  def display_stats
    name = @data['form'][0]['name']
    types = @data['types']
    one = types[0]['type']['name']
    two = types[1]['type']['name']

    puts "Pokemon Name: #{name}"
    puts "Type 1: #{one} "
    puts "Type 2: #{two}" unless types[1].empty?

    # poketypes = PokeTypes.new(one.to_s)
    # poketypes.display_stats # will this method work? Should I name it something different?
  end

end
