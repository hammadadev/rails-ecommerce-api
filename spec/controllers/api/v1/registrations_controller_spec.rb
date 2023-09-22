require 'rails_helper'

describe Api::V1::RegistrationsController, type: :request do
  context 'GET /api/v1/signup' do

    let(:user_params) { FactoryBot.attributes_for :user, password: "q1w2e3r4"}
    
    it "should return a newly created user with jwt" do
      post api_v1_signup_path, params: user_params, as: :json
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(parsed_response["data"]["user"].keys).to match_array(["id", "firstname", "lastname", "username", "email"])
      expect(parsed_response["data"]["token"]).not_to be(nil)
    end


    it "should return errors when password params are missing" do
      post api_v1_signup_path, params: user_params.except(:password), as: :json
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_response["error"]).to eq({"password"=>["can't be blank"], "password_digest"=>["can't be blank"]}
      )
    end
  end  

  context 'GET /api/v1/login' do
    let(:user) { FactoryBot.create :user}
    it "should login the user and return jwt and user information" do
      post api_v1_login_path, params: {email_or_username: user.username, password: "q1w2e3r4"}, as: :json
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["data"]["user"].keys).to match_array(["id", "firstname", "lastname", "username", "email"])
      expect(parsed_response["data"]["token"]).not_to be(nil)
    end

    it "should return unauthorized when any of the credentials are invalid" do
      post api_v1_login_path, params: {email_or_username: user.username, password: "q1w2"}, as: :json
      expect(response).to have_http_status(:unauthorized)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["error"]).to eq("unauthorized")
     
      
    end

  end

end