require 'rails_helper'

describe Api::V1::ProductsController, type: :request do

  before(:all) do
    products = create_list(:product, 3)
    @user = create(:user)
  end

  context 'GET /api/v1/products' do  

    it "should return a list of products" do
      get api_v1_products_path, :headers => {'Authorization' => authenticate(@user)}, as: :json
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(parsed_response["data"].count).to eq(3)
    end
    
  end  
end  