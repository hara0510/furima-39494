FactoryBot.define do
  factory :order_address do
    postal_code   { "111-1111" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    address       { Faker::Address.street_address }
    building      { Faker::Address.secondary_address }
    tel           { Faker::Number.number(digits: rand(10..11)) }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end