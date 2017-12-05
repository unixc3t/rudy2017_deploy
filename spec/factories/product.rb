FactoryBot.define do
  factory :product do
    name { FFaker::Name.name }
    price 100
  end
end