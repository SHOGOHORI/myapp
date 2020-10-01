require 'rails_helper'

RSpec.feature "UsersLogins", type: :feature do
  scenario '有効なログイン、ログアウト' do
    user = create(:user)
    visit login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    check 'このコンピューターを記憶しますか？'
    click_button 'ログイン'
    expect(current_url).to eq user_url(user)
    visit current_path
    click_link 'アカウント'
    click_link 'ログアウト'
    expect(current_url).to eq root_url
    expect(page).to have_link 'ログイン', href: login_path
  end

  scenario '無効なログイン' do
    visit login_path
    fill_in 'メールアドレス', with: "  "
    fill_in 'パスワード', with: "  "
    click_button 'ログイン'
    expect(current_url).to eq login_url
    expect(page).to have_content '無効なメールアドレスとパスワードの組合わせです'
    visit root_path
    expect(page).to_not have_content '無効なメールアドレスとパスワードの組合わせです'
  end

  scenario '有効なメールアドレスと無効なパスワード' do
    user = create(:user)
    visit login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: "invalid"
    click_button 'ログイン'
    expect(current_url).to eq login_url
    expect(page).to have_content '無効なメールアドレスとパスワードの組合わせです'
    visit root_path
    expect(page).to_not have_content '無効なメールアドレスとパスワードの組合わせです'
  end

end