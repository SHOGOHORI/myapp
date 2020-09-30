require 'rails_helper'

RSpec.describe "AccessToUsers", type: :request do 
  describe 'GET #new' do
    it 'ユーザー登録画面にアクセスする' do
      get signup_path
      expect(response).to have_http_status 200
    end
  end

  describe 'アクセス制限' do
    let!(:user) { create(:user) }
    let!(:admin_user) { create(:user, :admin_user) }
    
    it 'ユーザー一覧' do
      get users_path
      assert_redirected_to login_url
    end

    it 'ユーザー編集画面' do
      get edit_user_path(user)
      assert_redirected_to login_url
    end

    it 'ユーザー編集' do
      patch user_path(user) 
      assert_redirected_to login_url
    end
  end
end
