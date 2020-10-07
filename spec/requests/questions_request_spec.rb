require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe 'ログイン無アクセス制限' do
    let!(:user) { create(:user) }
    let!(:question) { create(:question, user_id: user.id) }
    it '質問投稿' do
      expect {
      post questions_path, params: { question: { title: "title", 
                                                content: "Lorem ipsum" } }
              }.to change(User, :count).by(0)
      expect(response).to redirect_to login_url
    end

    it '質問削除' do
      expect {
      delete question_path(question)
              }.to change(User, :count).by(0)
      expect(response).to redirect_to login_url
    end
  end
end
