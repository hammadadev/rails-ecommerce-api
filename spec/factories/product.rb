FactoryBot.define do
  factory(:product) do
    name {Faker::Name.first_name}
    description {Faker::Quote.famous_last_words}
    rating {Faker::Number.between(from: 1, to: 5)}
    price {Faker::Number.decimal}
    category {Faker::Appliance.brand}
    image {Faker::JapaneseMedia::OnePiece.character}
  end
end