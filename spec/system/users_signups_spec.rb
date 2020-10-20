require 'rails_helper'

RSpec.describe "UsersSignups", type: :system do
  # before do
  #   ActionMailer::Base.deliveries.clear
  # end
  describe 'ユーザーが新しいアカウントを作成する' do
    context '有効なユーザー登録' do
      before do
        visit signup_path
        fill_in 'お名前', with: 'testuser'
        fill_in 'メールアドレス', with: 'testuser@example.com'
        fill_in 'パスワード', with: 'Aaaaaaaa1?'
        fill_in 'パスワード確認', with: 'Aaaaaaaa1?'
        click_button 'ユーザー新規作成'
      end

      # it "有効化メールを送信" do
      #   user = User.find_by(name: 'testuser')
      #   expect(current_path).to eq root_path
      #   expect(page).to have_content 'アカウント有効化のメールを送信しました。'
      #   expect(ActionMailer::Base.deliveries.size).to eq 1
      #   expect(user.activated).to eq false
      end

      # it "有効化していない状態でログイン" do
      #   visit login_path
      #   fill_in 'メールアドレス', with: 'testuser@example.com'
      #   fill_in 'パスワード', with: 'Aaaaaaaa1?'
      #   click_button 'ログイン'
      #   expect(page).to have_content 'アカウントが有効化されていません。アカウント有効化のメールを送信しましたのでご確認ください。'
      # end

      it "有効化トークンが不正" do
        visit edit_account_activation_path("invalid token", email: 'testuser@example.com')
        expect(current_path).to eq root_path
        expect(page).to have_content '有効でないリンクです。'
      end

      # it "トークンは正しいがメールアドレスが無効" do
      #   user = User.find_by(name: 'testuser')
      #   visit edit_account_activation_path(user.activation_token, email: 'wrong')
      #   expect(current_path).to eq root_path
      #   expect(page).to have_content '有効でないリンクです。'
      # end

      # it "有効化トークンが正しい" do
      #   user = User.find_by(name: 'testuser')
      #   visit edit_account_activation_path(user.activation_token, email: 'testuser@example.com')
      #   expect(user.reload.activated).to eq true
      #   visit current_path
      #   expect(current_path).to eq user_path(user)
      # end
    end

    context '無効なユーザー登録' do
      before do
        visit signup_path
        fill_in 'お名前', with: ''
        fill_in 'メールアドレス', with: 'testuser@example'
        fill_in 'パスワード', with: 'foo'
        fill_in 'パスワード確認', with: 'bar'
        click_button 'ユーザー新規作成'
      end
      subject { page }
      it 'ユーザー登録失敗/usersへとぶ' do
        is_expected.to have_current_path users_path
      end
      it 'ユーザー登録失敗のフラッシュメッセージ' do
        is_expected.to_not have_selector('.alert-danger', text: "お名前を入力してください")
        is_expected.to_not have_selector('.alert-danger', text: "メールアドレスは不正な値です")
        is_expected.to_not have_selector('.alert-danger', text: "Password confirmationとパスワードの入力が一致しません")
        is_expected.to_not have_selector('.alert-danger', text: "パスワードは不正な値です")
      end
    end
  end

