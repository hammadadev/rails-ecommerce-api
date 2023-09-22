require 'rails_helper'

RSpec.describe User, :type => :model do

  context "validation errors" do

    let (:user_params) {FactoryBot.attributes_for :user, password: "q1w2e3r4"}
    let (:user) {FactoryBot.create :user, email: "johndoe@test.com", username: "john123"}

    it "is valid with valid attributes" do
      response = User.new(user_params)
      expect(response).to be_valid
    end

    it "is not valid without required params" do
      response = User.new({})
      expect(response.valid?).to be false

    end

    it "is not valid with duplicate email" do
      user_params[:email] = user.email
      response = User.new(user_params)
      expect(response.valid?).to be false
      expect(response.errors.messages). to eq({:email=>["has already been taken"]})
    end

    it "is not valid duplicate username" do
      user_params[:username] = user.username
      response = User.new(user_params)
      expect(response.valid?).to be false
      expect(response.errors.messages). to eq({:username=>["has already been taken"]})
    end

    it "is not valid without enum true or false for email_confirm?" do
      user_params[:email_confirm?] = "something wrong"
      expect { User.new(user_params) }
      .to raise_error(ArgumentError)
      .with_message("'something wrong' is not a valid email_confirm?")
    end

    it "is not valid with incorrect email format" do
      user_params[:email] = "invalidemail.test.com"
      response = User.new(user_params)
      expect(response.valid?).to be false
      expect(response.errors.messages). to eq({:email=>["is not a valid email"]})
    end
  end
end