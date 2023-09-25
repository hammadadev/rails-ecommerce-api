class Product < ApplicationRecord
  include Order

  validates :name, :description, :rating, presence: true
 
end
