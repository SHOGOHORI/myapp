require 'rails_helper'

RSpec.describe "UsersEdits", type: :system do
  scenario '有効でない編集' do
    user = create(:user)
    log_in_as(user)
    visit edit_user_path(user)
    fill_in 'お名前', with: " "
    fill_in 'メールアドレス', with: "foo@invalid"
    fill_in 'パスワード', with: "foo"
    fill_in 'パスワード確認', with: "bar"
    click_button 'プロフィール更新'
    expect(current_path).to eq user_path(user)
  end
  
  scenario '有効な編集' do
    user = create(:user)
    visit edit_user_path(user)
    log_in_as(user)
    expect(current_path).to eq edit_user_path(user)
    fill_in 'お名前', with: "Foo Bar"
    fill_in 'メールアドレス', with: "foo@bar.com"
    fill_in 'パスワード', with: ""
    fill_in 'パスワード確認', with: ""
    click_button 'プロフィール更新'
    expect(page).to have_content 'プロフィールを更新しました'
    expect(current_path).to eq user_path(user)
    user.reload
    expect(user.name).to eq "Foo Bar"
    expect(user.email).to eq "foo@bar.com"
  end

end
