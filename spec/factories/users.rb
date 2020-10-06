FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'Aaaaaaaa1?' }
    password_confirmation { 'Aaaaaaaa1?' }
    activated { true }
    activated_at { Time.zone.now }
    
    trait :admin_user do
      admin { true }
    end
    trait :login_user do
      login { true }
    end
  end
  factory :guest_user, class: User do
    name { "ゲストユーザー" }
    email { "test@example.com" }
    password { 'Aaaaaaaa1?' }
    password_confirmation { 'Aaaaaaaa1?' }
    activated { true }
    activated_at { Time.zone.now }
  end

end
