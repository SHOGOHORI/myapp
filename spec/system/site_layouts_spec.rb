require 'rails_helper'

RSpec.describe "SiteLayouts", type: :system do
  context'ログインせずにhomeにアクセス' do
    before { visit root_path }
    subject { page }
    it 'ホーム画面' do
      is_expected.to have_link , href: root_path
      is_expected.to have_link '概要', href: about_path
      is_expected.to have_link 'ユーザー登録', href: signup_path
      is_expected.to have_link 'ログイン', href: login_path
    end
  end
  context'ログインしてにhomeにアクセス' do
    let!(:user) { create(:user) }
    before do
      log_in_as(user)
    end
    subject { page }
    it 'ホーム画面' do
      is_expected.to have_link , href: root_path
      is_expected.to have_link '概要', href: about_path
      is_expected.to have_link 'ユーザー一覧', href: users_path
      is_expected.to_not have_link nil, href: login_path
      click_link 'アカウント'
      is_expected.to have_link '設定', href: edit_user_path(user)
      is_expected.to have_link 'プロフィール', href: user_path(user)
      is_expected.to have_link 'ログアウト', href: logout_path
    end
  end
end
