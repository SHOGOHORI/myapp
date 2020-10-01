FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'Aaaaaaaa1?' }
    password_confirmation { 'Aaaaaaaa1?' }
    
    trait :admin_user do
      admin { true }
    end
    trait :login_user do
      login { true }
    end
  end
end
