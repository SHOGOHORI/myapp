FactoryBot.define do
  factory :user do
    name { "Example User" }
    email { "user@example.com" }
    password { 'Aaaaaaaa1?' }
    password_confirmation { 'Aaaaaaaa1?' }
  end
end
