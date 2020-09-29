FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "Aaaaaaaa1?" }
    password_confirmation { "Aaaaaaaa1?" }
  end
end
