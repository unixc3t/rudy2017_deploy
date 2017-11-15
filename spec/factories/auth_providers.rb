FactoryBot.define do
  factory :auth_provider do
    user nil
    provider 'github'
    uid '123123'
  end
end
