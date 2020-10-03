require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create(:user) }
  describe "アカウント有効化" do
    let(:mail) { UserMailer.account_activation(user) }
    context "ヘッダー" do
      # it { expect(mail.subject).to eq("【育児Q&A】アカウント認証手続きを完了してください") }
      it { expect(mail.to).to eq([user.email]) }
      it { expect(mail.from).to eq(["noreply@example.com"]) }
    end
    subject { mail.body.encoded }
    context "ボディ" do
      # it { is_expected.to match("育児Q&Aに登録するには、以下のリンクをクリックしてアカウントを有効化してください。") }
      it { is_expected.to match(user.name) }
      it { is_expected.to match(user.activation_token) }
      it { is_expected.to match(CGI.escape(user.email)) }
    end
  end
end
