require 'rails_helper'

describe Api::V1::RegistrationsController, type: :request do
  context 'GET /api/v1/signup' do

    let(:user) { FactoryBot.attributes_for :user, password: "q1w2e3r4"}
    
    it "should return a newly created user with jwt" do
      post api_v1_signup_path, params: user, as: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["data"]["user"].keys).to match_array(["id", "firstname", "lastname", "username", "email"])
    end

  end

end