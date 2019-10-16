FactoryBot.define do
  factory :user do
    name  { Faker::Name.name }
    email { Faker::Internet.email(name: name) }
  end
end
