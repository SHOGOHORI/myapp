# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# メインのサンプルユーザーを1人作成する
User.create!(name:  "shogohori",
  email: "shogo.hori.1988@gmail.com",
  password:              "Aaaaaaaa1?",
  password_confirmation: "Aaaaaaaa1?",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

  User.create!(name:  "ゲストユーザー",
    email: "test@example.com",
    password:              "Aaaaaaaa1?",
    password_confirmation: "Aaaaaaaa1?",
    activated: true,
    activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "Aaaaaaaa1?"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end

# ユーザーの一部を対象にQ&Aを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 30)
  title = Faker::Lorem.sentence(word_count: 3)
  users.each { |user| user.questions.create!(content: content,title: title) }
end

shogo = User.first
content = Faker::Lorem.sentence(word_count: 30)
question = Question.first
Answer.create(content: content,
              user_id: shogo.id,
              question_id: question.id)
