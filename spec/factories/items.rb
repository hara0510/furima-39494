FactoryBot.define do
  factory :item do
    item_name      { Faker::Commerce.product_name }
    description    { Faker::Lorem.paragraph }
    category_id    { Faker::Number.between(from: 1, to: 11) }
    condition_id   { Faker::Number.between(from: 1, to: 7) }
    shippingfee_id { Faker::Number.between(from: 1, to: 48) }
    prefecture_id  { Faker::Number.between(from: 1, to: 3) }
    deliveryday_id { Faker::Number.between(from: 1, to: 4) }
    price          { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
