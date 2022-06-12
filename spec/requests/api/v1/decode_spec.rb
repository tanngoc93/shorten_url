require 'rails_helper'

describe 'GET /api/v1/decode' do

  # scenario with token is nil
  context 'decode with wrong token' do
    let!(:url) { FactoryBot.create(:url) }

    # scenario with token is nil
    it 'should return fetched unsuccessfully' do
      get '/api/v1/decode', params: {
        token: nil
      }

      expect(response.status).to eq(404)
      
      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('Url fetched unsuccessfully')
    end

    # scenario with token does not exist
    it 'should return fetched unsuccessfully' do
      get '/api/v1/decode', params: {
        token: Faker::String.random
      }

      expect(response.status).to eq(404)

      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('Url fetched unsuccessfully')
    end
  end

  context 'decode with correct token' do
    let!(:url) { FactoryBot.create(:url) }

    it 'should return fetched successfully' do
      get '/api/v1/decode', params: {
        token: url.token
      }

      expect(response.status).to eq(200)

      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('Url fetched successfully')
      expect(json[:data][:original_url]).to eq(url.original_url)
    end
  end
end