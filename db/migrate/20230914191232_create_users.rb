class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstname, null: false
      t.string :lastname
      t.string :username, null: false, index: {unique: true, name: 'unique_usernames'}
      t.string :email, null: false, index: {unique: true, name: 'unique_emails'}
      t.string :password, null: false
      t.string :phone_number
      t.boolean :email_confirm?, null: false, default: 0
      t.timestamps
    end
  end
end
