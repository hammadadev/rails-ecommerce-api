class AddFieldsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :price, :decimal, null: false
    add_column :products, :category, :string, null: false
    add_column :products, :image, :string, null: false
  end
end
