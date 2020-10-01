require 'rails_helper'

RSpec.describe "AccessToUsers", type: :request do 
  let!(:user) { create(:user) }
  let!(:admin_user) { create(:user, :admin_user) }

  describe 'GET #new' do
    it 'ユーザー登録画面にアクセスする' do
      get signup_path
      expect(response).to have_http_status 200
    end
  end

  context 'ログイン無アクセス制限' do
    it 'ユーザー一覧' do
      get users_path
      expect(flash[:danger]).to include("ログインしてください")
      assert_redirected_to login_url
    end

    it 'ユーザー編集画面' do
      get edit_user_path(user)
      expect(flash[:danger]).to include("ログインしてください")
      assert_redirected_to login_url
    end

    it 'ユーザー編集' do
      patch user_path(user) 
      expect(flash[:danger]).to include("ログインしてください")
      assert_redirected_to login_url
    end
  end
  context 'ログインあり別ユーザーへのアクセス制限' do
    before do
      log_in_as(user)
    end
    it 'ユーザー編集画面' do
      get edit_user_path(admin_user)
      assert_redirected_to login_url
    end   
  end
end
