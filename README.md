# README

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。

```
$ git clone https://github.com/SHOGOHORI/myapp.git
```

その後、次のコマンドで必要になる RubyGems をインストールします。

```
$ bundle install --without production
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
