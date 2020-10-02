require 'rails_helper'

RSpec.describe "AccessToUsersLogins", type: :request do
  let!(:user) { create(:user) }
  describe 'ログアウト後、2番目のウィンドウでログアウト' do
    before do
      post login_path, params: { session: { email: user.email,
                                            password: user.password,
                                            remember_me: '1' } }
    end
    it '2番目のウィンドウでログアウト' do
      delete logout_path
      expect(is_logged_in?).to be false
      expect(response).to redirect_to root_url
      delete logout_path
      follow_redirect!
      expect(response.body).to include('ログイン')
      expect(response.body).to_not include('ログアウト')
      expect(response.body).to_not include('アカウント')
    end
  end

  describe '記憶トークン' do
    before do
      post login_path, params: { session: { email: user.email,
                                            password: user.password,
                                            remember_me: '1' } }
    end
    it 'コンピューターが記憶してログイン' do
      expect(cookies[:remember_token]).to eq assigns(:user).remember_token
    end
    it 'コンピューターが記憶せずにログイン' do
      delete logout_path
      post login_path, params: { session: { email: user.email,
                                            password: user.password,
                                            remember_me: '0' } }
      expect(cookies[:remember_token]).to be_empty
    end
  end
end
