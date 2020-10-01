require 'rails_helper'

RSpec.describe "UsersSignups", type: :system do
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
      it 'ユーザー登録成功' do
        expect(flash[:success]).to include("ユーザー登録完了しました")
        follow_redirect!
        expect(response).to get user_path(User.last)
        expect(is_logged_in?).to be true
      end
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
      it 'ユーザー登録失敗' do
      end
    end
  end
end
