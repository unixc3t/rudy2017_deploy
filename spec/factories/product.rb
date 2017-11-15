FactoryBot.define do
  factory :product do
    name { FFaker::Name }
    price 100
  end
end