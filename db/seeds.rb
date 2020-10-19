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
names  = ["Naomi", "Youko", "Hanako", "Maria", "Yokota", "Koji"]
names.each do |name|
  email = "example-#{name}@example.org"
  introduction = "#{name}です。宜しくおねがいします。"
  password = "Aaaaaaaa1?"
  User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password,
      introduction: introduction,
      activated: true,
      activated_at: Time.zone.now)
end

# サンプル質問、回答(1)
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

# サンプル質問、回答(2)
Question.create!(title:  "離乳食を嫌がる",
  category: "食事",
  content: "数日前から離乳食をはじめました。\n
            初日に10倍粥をあげたのですが全然食べてくれず、たらたらと口からこぼれてしまい…\n
            最初だから仕方がないと思ったのですが、数日経った今も全然食べてくれません。\n
            こぼしていたのは最初だけで今は食べさせると体をのけぞらせて嫌がります。\n
            どうしたら食べてくれるでしょうか…",
  user_id: 4)

Answer.create!(content: "裏ごしはしっかりしていますか？\n
                        赤ちゃんは母乳やミルクなどの液体以外を口にするのが初めてなので固形っぽさが残っていると戸惑ってしまいます。\n
                        もし裏ごしがたらずつぶつぶしているようだったらしっかり裏ごしすると少し違うかもしれません。",
              user_id: test_user.id,
              question_id: 2)

Answer.create!(content: "うちも10倍粥嫌がりました！\n
                         にんじんのペーストは食べてくれたのでおかゆににんじんを混ぜてあげたら食べてくれるようになりましたよ！\n
                         無理してバランスよくあげることだけ考えずに食べられるものから食事に慣らしていくのも良いかもしれません(^^)",
      user_id: 1,
      question_id: 2)

# サンプル質問、回答(3)
Question.create!(title:  "寝返りで起きる",
                 category: "健康",
                 content: "寝返りを覚えたばかりの息子が夜寝ている間に寝ぼけて？寝返りしてしまい苦しくなって起きて泣いてしまいます。\n
                           寝返りしないようにタオルを丸めたものをサイドにおいたのですが乗り越えて寝返りしてしまいます。\n
                           夜中毎晩のように起こされて寝かしつけをしているので寝不足になってしまいました。\n
                           どうにか寝返りせずに寝てもらうにはどうしたら良いでしょうか？",
                 user_id: test_user.id)

Answer.create!(content: "こんにちは。ゆっくりと眠れない夜が続くとつらいですよね。\n
                        うちは寝返りをし始めた頃は２リットルペットボトルに水を入れて蓋をテープでしっかり留めたものを何個か用意してそれをタオルに巻いてストッパーにしていましたよ。\n
                        時折それでも寝返りしてしまうことがありましたが、もう潔く夜は眠れないもの（新生児の頃もそうでしたし）と割り切って昼夜問わず子供が寝ているときに一緒に細切れで寝るようにしていました。\n
                        いずれ寝返り返りを覚えるのでそれまでの辛抱です！眠れるときに寝てくださいね！",
              user_id: 1,
              question_id: 3)

# サンプル質問、回答(4)
Question.create!(title:  "汚い言葉を辞めさせたい",
                 category: "教育",
                 content: "３歳の息子が「死ね」や「殺す」などという言葉を使うようになってしまいました…\n
                           はじめてその言葉を息子の口から聞いた時はショックでかたまってしまいました。\n
                           家でそんな言葉は使っていないつもりなのですが…外で覚えてきてしまったのでしょうか。\n
                           そういうことは言わないようにと注意しても笑うだけで聞いてくれません。\n
                           とても悲しいです。今すぐ辞めさせたいです。",
                 user_id: 5)

Answer.create!(content: "今幼稚園に通っているうちの子どもも言いますよ！\n
                        辞めなさいと言っても面白がるだけで辞めないんですよね～\n
                        テレビや友達の真似なのかなと思ってます\n
                        いずれその言葉の重みがわかれば自然と使わなくなるんじゃないですかね？\n
                        一応諦めずに根気強くそういう言葉はよくないということだけは都度伝えるようにしてます！",
              user_id: test_user.id,
              question_id: 4)

# サンプル質問、回答(5)
Question.create!(title:  "吐き戻しはいつまで？",
                 category: "健康",
                 content: "生後３ヶ月の娘がミルクの後毎回吐き戻します。\n
                           飲ませすぎなのかと思い量を減らしたのですが足りないのか泣いてしまい、結局たくさん飲んでは戻してしまいます。戻したあとも元気そうにしているので体調が悪いわけではなさそうです。\n
                           吐き戻しを減らすコツはありますか？また、いつまで吐き戻しは続くのでしょうか？",
                 user_id: test_user.id)

Answer.create(content: "吐き戻しはだいたい３～４ヶ月ほどで落ち着いてきますが、個人差がありますので１歳頃まで続く子もいます。c
                        一日に何度も大量に吐いたり、吐いたものがピンク色だったりしませんか？その場合は病院で診てもらった方が良さそうです。",
              user_id: 3,
              question_id: 5)

Answer.create(content: "赤ちゃんのお腹はとっくり上になっているのでちょっとの刺激で中身が出てしまうことがあります。\n
                        うちの下の子もよく吐き戻すのでタオルをひいてなるべく家具など洗いづらいものを汚さないようにしています＾＾；\n
                        代わりにタオルは一日何枚も洗います！",
              user_id: 4,
              question_id: 5)

# サンプル質問、回答(6)
Question.create!(title:  "終わらないつわり・・・",
                 category: "妊娠",
                 content: "現在妊娠５ヶ月です\n
                           つわりがいつまでも終わりません・・・\n
                           最近はお腹も少し出てきて腰痛にも悩まされるようになりました\n
                           眠ることもできず寝不足です\n
                           何をしていても気持ちが悪くただただ横になっているしかないのですが\n
                           横になっているだけでも吐き気と腰痛がつらいです\n
                           これがまだずっと続くのかもしれないと思うと憂鬱です・・・\n
                           一般的にはもうじき落ち着く頃らしいですが・・・毎日つらいです",
                 user_id: test_user.id)

Answer.create!(content: "こればかりは個人差なのでなんとも言えませんが、遅くとも出産すると必ずつわりは終わります。\n
                         いつになるかはわからないけれどいずれ絶対に終わるんです！\n
                         さすがに出産まで続くことは稀なのできっとその前には終わると思います。\n
                         現在５ヶ月ということで、たしかにそろそろ落ち着く頃ですね。\n
                         じわじわおさまる人もいれば急にピタッとおさまる人もいるみたいです。\n
                         つらくて仕方がない場合は産院に相談してみては？\n
                         妊娠中でも飲める吐き気止めを処方してくれるところもありますよ。\n
                         効き目はこれまた個人差がありますが効く人はかなり効くようです！\n
                         少しでも早くつわりがおさまって素敵なマタニティライフが送れますように…c
                         頑張ってください、赤ちゃんに会えるのはもうすぐですよ！",
              user_id: 7,
              question_id: 6)

# サンプル質問、回答(7)
Question.create!(title:  "人見知り場所見知りが酷い",
                 category: "人見知り",
                 content: "生後５ヶ月過ぎから人見知りや場所見知りをするようになりました。\n
                           外出すると火がついたように泣いてしまうのでどこにも行けません。\n
                           この時期がすぎるまで家で過ごしていてもそのうちおさまるのでしょうか？",
                 user_id: test_user.id)

Answer.create!(content: "家で過ごさずどんどん外に連れて行って上げた方が外に慣れて泣くことも減ると思います。\n
                         最初のうちは泣いてしまって戸惑うかもしれませんが、赤ちゃんは泣いてしまうもの！\n
                         割り切って赤ちゃんが泣いていても大丈夫そうなところから外に慣らしていくと良いと思います。",
              user_id: 1,
              question_id: 7)

# サンプル質問、回答(8)
Question.create!(title:  "育児を手伝わない父親",
                 category: "家族関係",
                 content: "夫が全くと言っていいほど育児をしません。\n
                           子どもは一人目で生後２ヶ月になりました。生後１ヶ月までは里帰りしていました。\n
                           私はまだ産後で体の調子が悪いのですが主人は育児だけでなく家事もろくすっぽやりません。\n
                           すべて私がひとりでやっています。\n
                           夫も子どものことはかわいがってはいるのですがオムツ替えもお風呂も拒否です。\n
                           たまにふと無性にかなしくなって子どもを抱いたままひとり泣いてしまいます。\n
                           みなさんの旦那様は産後の育児や家事を手伝ってくれましたか？\n
                           手伝ってくれるご家庭は何かお願いをしましたか？",
                 user_id: 7)

Answer.create!(content: "うちは育児も家事もぼちぼち手伝ってくれていました。\n
                         仕事で疲れている日は何もしてくれませんでしたが、仕方ないと思って諦めました。\n
                         とくに何かお願いはしていませんが主人が仕事の休みの日などは家事をやってくれるように頼んで私は少しゆっくりしていました。\n
                         旦那さんに何を言っても何もしてくれないのであれば実家に頼るのはどうでしょうか。c
                         ひとりきりで育児はノイローゼになってしまうかもしれません、頼れる人に頼っていきましょう！",
              user_id: test_user.id,
              question_id: 8)

Answer.create!(content: "私は１歳になる子どもの父親です。\n
                         私の妻も質問者と同様に、生後１ヶ月まで里帰りしてから、我が家に帰ってきました。\n
                         当時私の仕事が忙しく、それを言い訳にして全く育児に参加しませんでした。\n
                         しかし、同じ業務をしている先輩が、仕事もしっかりこなした上に、3歳になる子どもの育児に積極的に参加していました。\n
                         その姿を見て仕事を言い訳にするのは間違っていた、やはり家族あっての自分だから、家族を大事にしないとな、と考えるようになり、少しづつ育児に参加するようになりました。\n
                         それでもやはり「育児は母親がするもの」と考える人を変えるのは非常に難しいと考えます。\n
                         他の方が回答しているように、もし育児が辛いようなのであれば、頼れる人に頼って場合によっては実家に帰ることも良いでしょう。",
               user_id: 1,
               question_id: 8)

# ユーザーの一部を対象にQ&Aを生成する
# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(word_count: 30)
#   title = Faker::Lorem.sentence(word_count: 3)
#   category = ["教育", "健康", "食事", "安全", "ママの悩み"]
#   users.each { |user| user.questions.create!(content: content,title: title,category: category.sample) }
# end
