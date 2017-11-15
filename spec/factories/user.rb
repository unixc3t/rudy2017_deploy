FactoryBot.define do
  factory :user do
    email {FFaker::Internet.email}
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    password '123456'
    password_confirmation '123456'

    trait :admin do
      role User.roles[:admin]
    end

    trait :user do
      role User.roles[:user]
    end
  end
end