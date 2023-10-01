require 'rails_helper'

describe Api::V1::ProductsController, type: :request do

  before(:all) do
    @user = create(:user)
    @product = create(:product)
  end

  context 'GET /api/v1/products' do  

    it "should return a list of products" do
      create_list(:product, 3)
      get '/api/v1/products', :headers => {'Authorization' => authenticate(@user)}, as: :json
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(parsed_response["data"].count).to eq(4)
    end    
  end 

  context 'POST /api/v1/products' do  

    it "should return a newly created product" do
      post '/api/v1/products', params: attributes_for(:product), :headers => {'Authorization' => authenticate(@user)}, as: :json
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(parsed_response["data"].keys).to match_array(["id", "name", "description", "rating", "price", "category", "image"])
    end

    it "should return a error when required params are missing" do
      post '/api/v1/products', params: FactoryBot.attributes_for(:product, name: nil), :headers => {'Authorization' => authenticate(@user)}, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end    
  end  

  context 'PUT /api/v1/products/:id' do  

    it "should update product name" do
      name = "Name is changed"
      put "/api/v1/products/#{@product.id}", params: {name: name}, :headers => {'Authorization' => authenticate(@user)}, as: :json
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(parsed_response["data"]["name"]).to eq(name)
    end

    it "should return not found when passing invalid id" do
      put "/api/v1/products/#{0}", params: {name: "Testing"}, :headers => {'Authorization' => authenticate(@user)}, as: :json
      expect(response).to have_http_status(:not_found)
    end   
  end  

  context 'GET /api/v1/products/:id' do  

    it "should get the product by id" do
      get "/api/v1/products/#{@product.id}", :headers => {'Authorization' => authenticate(@user)}, as: :json
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(parsed_response["data"]["id"]).to eq(@product.id)
    end

    it "should return not found when passing invalid id" do
      get "/api/v1/products/#{0}", :headers => {'Authorization' => authenticate(@user)}, as: :json
      expect(response).to have_http_status(:not_found)
    end   
  end  

  context 'DELETE /api/v1/products/:id' do  

    it "should delete the product by id" do
      delete "/api/v1/products/#{@product.id}", :headers => {'Authorization' => authenticate(@user)}, as: :json
      expect(response).to have_http_status(:no_content)
    end

    it "should return not found when passing invalid id" do
      delete "/api/v1/products/#{0}", :headers => {'Authorization' => authenticate(@user)}, as: :json
      expect(response).to have_http_status(:not_found)
    end   
  end  
end  