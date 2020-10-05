require 'rails_helper'

RSpec.describe "PasswordResets", type: :system do
  let!(:user) { create(:user) }
  describe 'パスワード再設定メール送信' do
    before do
      ActionMailer::Base.deliveries.clear
      visit new_password_reset_path
    end

    it 'パスワードリセットページへ' do
      expect(page).to have_content '登録されているメールアドレスを入力してください。'
    end

    it 'メールアドレスが無効' do
      fill_in '登録されているメールアドレスを入力してください。', with: ' '
      click_button 'パスワードの再設定'
      expect(page).to have_content 'メールアドレスが見つかりません'
      expect(current_path).to eq password_resets_path
    end

  #   it 'メールアドレスが有効' do
  #     fill_in '登録されているメールアドレスを入力してください。', with: user.email
  #     click_button 'パスワードの再設定'
  #     now_reset_digest = user.reload.reset_digest
  #     expect(now_reset_digest).to_not eq user.reset_digest
  #     expect(ActionMailer::Base.deliveries.size).to eq 1
  #     expect(page).to have_content 'パスワード再設定のメールを送信しましたのでご確認ください。'
  #     expect(current_path).to eq root_path
  #   end
  end

  # describe 'パスワード再設定画面' do
  #   before do
  #     visit new_password_reset_path
  #     fill_in '登録されているメールアドレスを入力してください。', with: user.email
  #     click_button 'パスワードの再設定'
  #     user.reload
  #   end
  #   it 'メールアドレスが無効' do
  #     visit edit_password_reset_path(user.reset_token, email: '  ')
  #     expect(current_path).to eq (root_path)
  #   end

  #   it '無効なユーザー' do
  #     user.toggle!(:activated)
  #     visit edit_password_reset_path(user.reset_token, email: user.email)
  #     expect(current_path).to eq (root_path)
  #   end

  #   it 'メールアドレスが有効、トークンが無効' do
  #     visit edit_password_reset_path(user.reset_token, email: user.email)
  #     expect(html).to have_content 'パスワード再設定のメールを送信しましたのでご確認ください。'
  #   end

  # end
end
