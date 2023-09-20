FactoryBot.define do
  factory(:user) do
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    email {Faker::Internet.unique.email}
    username {Faker::Name.unique.name}
    password {BCrypt::Password.create(Faker::Name.name)}
  end

end