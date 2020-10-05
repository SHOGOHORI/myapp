FactoryBot.define do
  factory :question ,class: Question do
    title { "title" }
    content { "MyText" }
    user_id { nil }
    created_at { 3.years.ago }
  end

  factory :orange ,class: Question do
    title { "orange" }
    content { "MyText" }
    user_id { nil }
    created_at { 10.minutes.ago }
  end

  factory :most_recent ,class: Question do
    title { "most_recent" }
    content { "MyText" }
    user_id { nil }
    created_at { Time.zone.now }
  end
end
