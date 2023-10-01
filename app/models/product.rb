class Product < ApplicationRecord
  include Order

  validates :name, :description, :rating, :price, :category, presence: true
  validates :rating, numericality: { greater_than: 0, less_than: 6}
 
end
