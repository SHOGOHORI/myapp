require 'rails_helper'

RSpec.describe "AccessToSessions", type: :request do
  describe 'GET #login' do
    it 'ログイン画面にアクセスする' do
      get login_path
      expect(response).to have_http_status 200
    end
  end
end
