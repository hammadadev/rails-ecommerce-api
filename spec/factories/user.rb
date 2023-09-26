FactoryBot.define do
  factory(:user) do
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    email {Faker::Internet.unique.email}
    username {Faker::Name.unique.name}
    password_digest {BCrypt::Password.create("q1w2e3r4")}
  end
end