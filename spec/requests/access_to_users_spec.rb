require 'rails_helper'

RSpec.describe "AccessToUsers", type: :request do
  describe 'GET #new' do
    it 'ユーザー登録画面にアクセスする' do
      get signup_path
      expect(response).to have_http_status 200
    end
  end
end
