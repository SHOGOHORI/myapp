FactoryBot.define do
  factory :question do
    title { "title" }
    content { "MyText" }
    user_id { nil }
  end
end
