require 'spec_helper'
require 'storage'
require 'redis'
require 'httparty'
require 'json'
require 'pry'

describe Storage do

  before do
    @redis = Redis.new
  end

  describe '#initialize' do
    context 'when a new instance of the class is initialized' do
      it 'creates an instance variable' do
        Storage.new(options = { 'id' => nil })

        expect(@id).to eq options['id']
      end
    end
  end

  describe '#check' do
    context 'if data was stored previously' do
      it 'calls on the cached function' do
      end
    end
    context 'if data was not stored previously' do
      it 'calls on the request_from_api function' do
      end
    end
  end

  describe '#cached?' do
    context 'when pokemon data is cached' do
      it 'returns true' do
        @redis.set('1', '{}')

        storage = Storage.new('1')

        expect(storage.cached?).to eq true
      end
    end

    context 'when pokemon data is not cached' do
      it 'returns false' do
        @redis.del('1') if @redis.exists('1')

        storage = Storage.new('1')

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

  describe ''
end
