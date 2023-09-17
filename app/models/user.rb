class User < ApplicationRecord

  has_secure_password
  
  enum :email_confirm?, {true: 0, false: 1}

  validates :firstname, :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true
  validates :email, :email_format => { :message => "is not a valid email" }

end
