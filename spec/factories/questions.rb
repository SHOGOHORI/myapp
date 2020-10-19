FactoryBot.define do
  factory :question ,class: Question do
    sequence(:title) { |n| "title#{n}" }
    sequence(:category) { |n| "category#{n}" }
    sequence(:content) { |n| "MyText#{n}" }
    user_id { nil }
    created_at { 3.years.ago }
  end

  factory :orange ,class: Question do
    title { "orange" }
    category { "fruits" }
    content { "MyText" }
    user_id { nil }
    created_at { 10.minutes.ago }
  end

  factory :most_recent ,class: Question do
    title { "most_recent" }
    category { "time" }
    content { "MyText" }
    user_id { nil }
    created_at { Time.zone.now }
  end
end
