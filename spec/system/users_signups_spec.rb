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
      subject { page }
      # it 'ユーザー登録後、フラッシュメッセージがでる' do
      #   is_expected.to have_selector('.alert-success', text: "ユーザー登録完了しました")
      #   is_expected.to have_current_path user_path(User.last)
      # end
      # it 'リロード後、フラッシュメッセージが消える' do
      #   visit current_path
      #   is_expected.to_not have_selector('.alert-success', text: "ユーザー登録完了しました")
      #   is_expected.to have_link 'ユーザー一覧', href: users_path
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
end
