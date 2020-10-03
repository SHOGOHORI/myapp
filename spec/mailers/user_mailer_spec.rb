require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create(:user) }
  describe "アカウント有効化" do
    let(:mail) { UserMailer.account_activation(user) }
    it "ヘッダー" do
      expect(mail.subject).to eq("【育児Q&A】アカウント認証手続きを完了してください")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["noreply@example.com"])
    end
    # subject { mail.body.encoded }
    it "ボディ" do
      # expect(mail.body.encoded).to match("育児Q&Aに登録するには、以下のリンクをクリックしてアカウントを有効化してください。") 
      expect(mail).to match(user.name)
      expect(mail.body).to match(user.activation_token)
      expect(mail.body).to match(CGI.escape(user.email))
    end
  end
end
