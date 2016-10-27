require 'spec_helper'
require 'pokemon'
require 'redis'
require 'httparty'
require 'json'

describe Pokemon do

  before do
    @redis = Redis.new
  end

  describe '#initialize' do
    context 'when a new instance of the class is initialized' do
      it 'creates an instance variable' do
        Pokemon.new(options = { 'id' => nil })

        expect(@id).to eq options['id']
      end
    end
  end

  describe '#check' do
    context 'if data was cached' do
      it 'calls on the function load_from_cache' do
        storage = Pokemon.new('1')

        storage.cached? == true

        expect(storage.load_from_cache)
      end
    end
    context 'if data was not cached' do
      it 'calls on the function request_from_api' do
        # storage = Pokemon.new('100')
        #
        # storage.cached? == false
        #
        # expect(storage.request_from_api)
      end
    end
  end

  describe '#cached?' do
    context 'when pokemon data is cached' do
      it 'returns true' do
        @redis.set('1', '{}')

        storage = Pokemon.new('1')

        expect(storage.cached?).to eq true
      end
    end

    context 'when pokemon data is not cached' do
      it 'returns false' do
        @redis.del('1') if @redis.exists('1')

        storage = Pokemon.new('1')

        expect(storage.cached?).to eq false
      end
    end
  end

  describe '#load_from_cache' do
    it 'loads data from pre-existing cache' do
      @redis.set('1', '{"forms": []}')

      hash = @redis.get('1')

      data = JSON.parse(hash)

      expect(data).not_to be_empty
    end
  end

  describe '#request_from_api' do
    it 'returns http success' do
    #  expect(@data).to has_http_status(:success)
    #  expect(@data.cache).to_be true
   end
  end

  describe '#cache' do
    context 'when data is requested from an api' do
      it 'stores data on redis' do
        redis = Redis.new

        data = redis.set('1', JSON.dump('{"forms": []}'))

        expect(data).not_to be_empty
      end
    end
  end
end
