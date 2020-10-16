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
  introduction: "宜しくおねがいします。",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

  User.create!(name:  "ゲストユーザー",
    email: "test@example.com",
    password:              "Aaaaaaaa1?",
    password_confirmation: "Aaaaaaaa1?",
    introduction: "ゲストユーザーです。",
    activated: true,
    activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
6.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@example.org"
introduction = "テストユーザーです。"
password = "Aaaaaaaa1?"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    introduction: introduction,
    activated: true,
    activated_at: Time.zone.now)
end

# サンプル質問、回答を作成する
Question.create!(title:  "生後一ヶ月のイビキについて",
  category: "健康",
  content: "こんにちは。生後1ヶ月になる娘がいます。\n
            夜中になるとフガフガとイビキをかいていて息苦しそうにしています。\n
            寝ている間にSIDSにならないか心配です。\n
            このまま様子を見るだけで良いのか、それとも鼻の吸引などしてあげた方がいいのでしょうか？",
  user_id: 3)

question = Question.first
test_user = User.find_by(email: "test@example.com")
Answer.create(content: "こんにちは。\n
                        息苦しそうにしている赤ちゃんを見ていると心配になりますよね。\n
                        赤ちゃんは大人より鼻孔が狭いためイビキをかきやすいです。\n
                        イビキをかいているときに無呼吸にはなっておらず、顔色も悪くなく、起きているときに元気そうにしていれば大きな問題はないかと思います。\n
                        もしイビキがひどく心配なようでしたらお医者様に相談した方が良いかもしれません。",
              user_id: test_user.id,
              question_id: question.id)

Question.create!(title:  "離乳食を嫌がる",
  category: "食事",
  content: "数日前から離乳食をはじめました。\n
            初日に10倍粥をあげたのですが全然食べてくれず、たらたらと口からこぼれてしまい…\n
            最初だから仕方がないと思ったのですが、数日経った今も全然食べてくれません。\n
            こぼしていたのは最初だけで今は食べさせると体をのけぞらせて嫌がります。\n
            どうしたら食べてくれるでしょうか…",
  user_id: 4)

test_user = User.find_by(email: "test@example.com")
Answer.create(content: "裏ごしはしっかりしていますか？\n
                        赤ちゃんは母乳やミルクなどの液体以外を口にするのが初めてなので固形っぽさが残っていると戸惑ってしまいます。\n
                        もし裏ごしがたらずつぶつぶしているようだったらしっかり裏ごしすると少し違うかもしれません。",
              user_id: test_user.id,
              question_id: 2)


# ユーザーの一部を対象にQ&Aを生成する
# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(word_count: 30)
#   title = Faker::Lorem.sentence(word_count: 3)
#   category = ["教育", "健康", "食事", "安全", "ママの悩み"]
#   users.each { |user| user.questions.create!(content: content,title: title,category: category.sample) }
# end
