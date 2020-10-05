FactoryBot.define do
  factory :question do
    sequence(:title) { |n| "title#{n}" }
    sequence(:content) { |n| "MyText#{n}" }
    sequence(:user_id) { |n| }
    sequence(:created_at) { Time.zone.now }
  end
end
