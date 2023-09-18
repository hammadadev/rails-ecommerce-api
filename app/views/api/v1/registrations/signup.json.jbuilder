json.data do
  json.token @token
  json.user do
    json.id @user.id
    json.firstname @user.firstname
    json.lastname @user.lastname
    json.username @user.username
    json.email @user.email
  end  
end
