class User < ApplicationRecord

  has_secure_password
  
  enum :email_confirm?, {false: 0, true: 1}

  validates :firstname, :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true
  validates :email, :email_format => { :message => "is not a valid email" }

  scope :find_by_username_email, -> (email_or_username) {where(email: email_or_username).or(where(username: email_or_username))  }

end
