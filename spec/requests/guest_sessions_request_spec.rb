require 'rails_helper'

RSpec.describe "GuestSessions", type: :request do
  describe 'ゲストユーザーアクセス制限' do
    let!(:guest_user) { create(:guest_user) }
    before do
      post guest_path
    end
    it 'ログイン成功' do
      expect(flash[:success]).to include('ゲストユーザーでログインしました')
    end

    it 'ゲストユーザー編集画面' do
      get edit_user_path(guest_user)
      expect(response).to redirect_to root_path
    end

    it 'ゲストユーザー編集' do
      patch user_path(guest_user), params: { user: { name: guest_user.name,
                                                     email: guest_user.email } }
      expect(response).to redirect_to root_path
    end

    it 'ゲストユーザー削除' do
      expect {
              delete user_path(guest_user)
              }.to change(User, :count).by(0)
      expect(response).to redirect_to root_url
    end
  end
end
