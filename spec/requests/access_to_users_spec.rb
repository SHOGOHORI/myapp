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

  describe 'ログイン無アクセス制限' do
    it 'ユーザー一覧' do
      get users_path
      expect(flash[:danger]).to include("ログインしてください")
      expect(response).to redirect_to login_url
    end

    it 'ユーザー編集画面' do
      get edit_user_path(user)
      expect(flash[:danger]).to include("ログインしてください")
      expect(response).to redirect_to login_url
    end

    it 'ユーザー編集' do
      patch user_path(user), params: { user: { name: user.name,
                                        email: user.email } }
      expect(flash[:danger]).to include("ログインしてください")
      expect(response).to redirect_to login_url
    end

    it 'ユーザー削除' do
      expect {
        delete user_path(user)
      }.to change(User, :count).by(0)
      expect(flash[:danger]).to include("ログインしてください")
      expect(response).to redirect_to login_url
    end
  end

  describe '権限なしユーザーの別ユーザーへのアクセス制限' do
    before do
      post login_path, params: { session: { email: user.email,
                                            password: user.password,
                                            remember_me: '1' } }
    end
    it 'ユーザー編集画面' do
      get edit_user_path(admin_user)
      expect(flash).to be_empty
      expect(response).to redirect_to root_url
    end

    it 'ユーザー編集' do
      patch user_path(admin_user), params: { user: { name: admin_user.name,
                                             email: admin_user.email } }
      expect(flash).to be_empty
      expect(response).to redirect_to root_url
    end

    it '権限をWeb経由で編集' do
      expect(user).to_not be_admin
      patch user_path(user), params: {
                                    user: { password:              user.password,
                                            password_confirmation: user.password,
                                            admin: true } }
      expect(user.reload).to_not be_admin
    end

    it 'ユーザー削除' do
      expect {
        delete user_path(user)
      }.to change(User, :count).by(0)
      expect(flash).to be_empty
      expect(response).to redirect_to root_url
    end
  end

  describe '権限ありユーザーのアクション' do
    before do
      post login_path, params: { session: { email: admin_user.email,
                                            password: admin_user.password,
                                            remember_me: '1' } }
    end
    it 'ユーザー削除' do
      expect {
        delete user_path(user)
      }.to change(User, :count).by(-1)
      expect(flash[:success]).to include("ユーザーを削除しました")
      expect(response).to redirect_to users_url
    end
  end
end

