require 'rails_helper'

RSpec.describe "SiteLayouts", type: :system do
  context'homeにアクセス' do
    before { visit root_path }
    subject { page }
    it 'ログインしていないときのホーム画面' do
      is_expected.to have_link , href: root_path
      is_expected.to have_link '概要', href: about_path
      is_expected.to have_link 'ユーザー登録', href: signup_path
      is_expected.to have_link 'ログイン', href: login_path
    end
  end
end
