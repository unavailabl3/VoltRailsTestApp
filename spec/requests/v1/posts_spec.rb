require 'rails_helper'
#curl -X POST -d "title=NewTitle&body=NewBody" http://localhost:3000/api/v1/posts.json
#curl -H "Content-Type: application/json" -X POST -d '{"email":"example@mail.com","password":"example"}' http://localhost:3000/auth/login
RSpec.describe 'Posts API', type: :request do
  
  let(:authurl) { '/auth/login' }

  context 'get Token test'
    before do
      @user = FactoryBot.create(:user)
      post authurl, params: {email: @user.email, password: "password"}.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      @token =  JSON.parse(response.body)['token']
    end

    it 'token exists' do
      expect(JSON.parse(response.body)['token']).not_to eq(nil)
    end

  describe 'GET /posts.json' do
    before do
      get "/api/v1/posts.json", headers: { 'Authorization' => "Bearer #{@token}" }
    end
    it 'posts exists' do
      expect(JSON.parse(response.body)['data']).not_to eq(nil)
    end
  end

  describe 'GET /posts/:id.json' do
    before do
      FactoryBot.create(:post)
      get "/api/v1/posts/1.json", headers: { 'Authorization' => "Bearer #{@token}" }
    end
    it 'posts exists' do
      expect(JSON.parse(response.body)['data']).not_to eq(nil)
    end
  end

  describe 'GET /posts/:id.json' do
    before do
      FactoryBot.create(:post)
      post "/api/v1/posts.json", params: {title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph}, headers: { 'Authorization' => "Bearer #{@token}" }
    end
    it 'posts exists' do
      expect(JSON.parse(response.body)['data']).not_to eq(nil)
    end
  end

end
