class User < ApplicationRecord

  attribute :password_confirmation, :string

  enum :email_confirm?, {true: 0, false: 1}
  
  validates :firstname, :username, :email, :password, presence: true
  validates :password, length: { in: 6..15 }
  validates :username, :email, uniqueness: true
  validates :email, :email_format => { :message => "is not a valid email" }

end
