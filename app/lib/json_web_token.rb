module JsonWebToken
require "jwt"

  SECRET_KEY = Rails.application.secret_key_base

   def jwt_encode(payload, exp = 24.hours.from_now.to_i, iss = "Rails app")
    payload[:exp] = exp
    payload[:iss] = iss
    JWT.encode(payload, SECRET_KEY, 'HS256')
   end

   def jwt_decode(token) 
    decoded = JWT.decode(token, SECRET_KEY, 'HS256')[0]
    HashWithIndifferentAccess.new decoded
   end
end