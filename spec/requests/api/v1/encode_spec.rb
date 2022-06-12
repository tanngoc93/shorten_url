require 'rails_helper'

describe 'POST /api/v1/encode' do

  context 'encode with wrong original_url' do
    it "should return url can't be blank" do
      post '/api/v1/encode'

      expect(response.status).to eq(400)
      
      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq("Original url can't be blank")
    end

    it "should return url can't be blank" do
      post '/api/v1/encode', params: {
        original_url: nil
      }

      expect(response.status).to eq(400)
      
      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq("Original url can't be blank")
    end

    it "should return url is invalid" do
      post '/api/v1/encode', params: {
        original_url: "www.google.com"
      }

      expect(response.status).to eq(400)
      
      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq("Original url is invalid")
    end
  end

  context 'encode with wrong original_url' do
    it "should return" do
      post '/api/v1/encode', params: {
        original_url: "https://www.google.com/"
      }

      expect(response.status).to eq(200)

      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq("Url created successfully")
    end
  end
end