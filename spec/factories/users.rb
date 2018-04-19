FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password 'test'
  end
end
