require 'rails_helper'

RSpec.describe "AccessToSessions", type: :request do
  describe 'GET #login' do
    it 'ログイン画面にアクセスする' do
      get login_path
      expect(response).to have_http_status 200
    end
  end
  # describe 'フレンドリーフォワーディング' do
  #   let!(:user) { create(:user) }
  #   it "フレンドリーフォワーディングを記憶" do
  #     redirect_to edit_user_path(user)
  #     expect(page.get_rack_session_key('forwarding_url')).to eq edit_user_url(user)
  #     log_in_as(user)
  #     expect(page.get_rack_session_key('forwarding_url')).to be_nil
  #   end
  # end
end
