require 'rails_helper'

RSpec.describe "AccessToUsers", type: :request do
  describe 'GET #new' do
    it 'ユーザー登録画面にアクセスする' do
      get signup_path
      expect(response).to have_http_status 200
    end
  end

  # describe 'ログインしていないユーザーのアクセス制限' do
  #   it 'ユーザー一覧表示' do
  #     get users_path
  #     is_expected.to has_current_path login_path
  #   end
  # end
end
