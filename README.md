# あなたの育児の困った！を救うQ&Aサイト*ーSUKUSUKUー*　ver.1

## 更新履歴
ver1:2020/10/20

## *ーSUKUSUKUー*とは？
育児の悩み、不安を救うための育児特化型のQ&Aアプリです。<br>
長男が生まれた直後、妻の病気により一週間ほど一人で育児をしていました。<br>
孤独で不安だったその時の経験から、ママ、パパの不安を少しでも埋めたいという思いから、SNSに近い形のQ&Aアプリを作成しました。<br>

Herokuで公開しています→[ーSUKUSUKUー](https://childcare-questions-and-answer.herokuapp.com/)

## 使用技術
フレームワーク：Rails6.0.3<br>
フロント：HTML、Sass、JavaScript（jQuery）<br>
サーバーサイド言語：Ruby2.7.1<br>
データベース：PostgreSQL<br>
テストフレームワーク：Minitest → Rspec<br>
サーバー構築：puma<br>
開発環境：Docker 19.3.12　→　ローカル環境<br>
本番環境：Heroku<br>
検索機能：ransack<br>
ページネーション機能：kaminari<br>
使用マシン：Mac Catalina(10.15.7)<br>
エディタ：VSCode<br>

## 機能
ユーザー機能：<br>
　・新規登録、ログイン、ログアウト、ゲストユーザーログイン機能<br>
　・ユーザープロフィール編集機能<br>
　・ユーザーマイページが投稿した質問、回答の一覧表示<br>
<br>
投稿機能：<br>
　・一覧表示、記事詳細表示、投稿、画像アップロード、編集、削除機能<br>
　・回答投稿機能<br>
<br>
質問検索機能：<br>
　・キーワード検索、タグ検索機能<br>
<br>
ページネーション機能：<br>
　・Ajax対応<br>
<br>
テスト機能：<br>
　・単体、統合テスト機能<br>


## インストール方法

まずはリポジトリを手元にクローンしてください。

```
$ git clone https://github.com/SHOGOHORI/myapp.git
```

その後、次のコマンドで必要になる RubyGems をインストールします。

```
$ bundle install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rspec
```

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

## 今後実装したい項目
　・マイページに子ども情報（年齢、性別）を追加<br>
　・回答の返信機能<br>
　・ミニ日記機能<br>
　・ブックマーク機能<br>
　・フォロー、アンフォロー機能<br>
　・アンケート機能<br>
　・SNSシェア機能<br>
　・デザインを充実させる<br>
　・AWSにデプロイ<br>

## 作者に関する情報
　堀彰吾<br>
　twitter<br>
   mail to: shogo.hori.1988@gmail.com<br>