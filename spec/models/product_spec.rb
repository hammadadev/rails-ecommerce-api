require 'rails_helper'

RSpec.describe Product, :type => :model do

  context "validation errors" do

    let (:product_params) {attributes_for :product}
    let (:product) {create :product}

    it "is valid with valid attributes" do
      response = Product.new(product_params)
      expect(response).to be_valid
    end

    it "is not valid without required params" do
      response = Product.new({})
      expect(response.valid?).to be false

    end

    it "is not valid with rating less than 1" do
      product_params[:rating] = 0
      response = Product.new(product_params)
      expect(response.valid?).to be false
      expect(response.errors.messages). to eq({:rating=>["must be greater than 0"]})
    end

    it "is not valid rating greater than 5" do
      product_params[:rating] = 6
      response = Product.new(product_params)
      expect(response.valid?).to be false
      expect(response.errors.messages). to eq({:rating=>["must be less than 6"]})
    end
  end
end