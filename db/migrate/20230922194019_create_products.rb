class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :rating, null: false, default: 0

      t.timestamps
    end
  end
end
