class Api::V1::ProductsController < ApplicationController
  before_action :get_product, only: [:show, :update, :destroy]
  def index
    @products = Product.all()
  end

  def create
    @product = Product.create!(product_params)
  end

  def show
    @product
    puts @product.inspect
  end

  def update
    @product.update!(product_params)
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def product_params
    params.permit(:id, :name, :description, :rating)
  end

  def get_product
    @product = Product.find(params[:id])
  end
end
