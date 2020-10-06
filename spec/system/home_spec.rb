require 'rails_helper'

RSpec.describe "Homes", type: :system do
  scenario 'homeにアクセス' do
    user = create(:user)

    visit root_path
    expect(page).to have_link , href: root_path
    expect(page).to have_link '概要', href: about_path
    expect(page).to have_link 'ユーザー登録', href: signup_path
    expect(page).to have_link 'ログイン', href: login_path
    log_in_as(user)
    visit root_path
    click_link 'ユーザー一覧'
    expect(page).to have_link , href: root_path
    expect(page).to have_link '概要', href: about_path
    expect(page).to have_link 'ユーザー一覧', href: users_path
    click_link 'アカウント'
    expect(page).to have_link 'プロフィール', href: user_path(user)
    expect(page).to have_link 'ログアウト', href: logout_path
  end
end
