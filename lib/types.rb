require 'redis'
require 'httparty'
require 'json'
# pokemon-types-api
class PokeTypes
  def initialize(type)
    @type = type
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
    @redis.exists(@type)
  end

  def load_from_cache
    @data = JSON.parse(@redis.get(@type))
  end

  def request_from_api
    url = "https://pokemon-types.herokuapp.com/types"

    @data = HTTParty.get(url).parsed_response

    cache
  end

  def cache
    @redis.set(@type, JSON.dump(@data))
  end

  def display_stats
    data = @data[@type.downcase]
    immunity = data['immunes']
    advantage = data['weaknesses']
    weakness = data['strength']

    puts "Immunity: #{immunity}" unless immunity.empty?
    puts "Advantage: #{advantage} " unless advantage.empty?
    puts "Weakness: #{weakness}" unless weakness.empty?
  end

end
