require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '質問' do
    let!(:user) { create(:user) }
    let(:question) { build(:question, title: title, content: content, user_id: user_id) }

    subject { question }
    context '有効な質問' do
      let(:user_id) { user.id }
      let(:title) { "困っています" }
      let(:content) { "子供が泣き止みません" }
      it { is_expected.to be_valid }
    end

    context 'ユーザーID無し' do
      let(:user_id) { nil }
      let(:title) { "困っています" }
      let(:content) { "子供が泣き止みません" }
      it { is_expected.to_not be_valid }
    end

    context 'content無し' do
      let(:user_id) { user.id }
      let(:title) { "   " }
      let(:content) { "子供が泣き止みません" }
      it { is_expected.to_not be_valid }
    end

    context "title無し" do
      let(:user_id) { user.id }
      let(:title) { "   " }
      let(:content) { "子供が泣き止みません" }
      it { is_expected.to_not be_valid }
    end

    context 'titleが長すぎる' do
      let(:user_id) { user.id }
      let(:title) { "a" * 301 }
      let(:content) { "子供が泣き止みません" }
      it { is_expected.to_not be_valid }
    end
  end

  describe '質問順' do
    questions = create_list(:question, 40)
    context '質問が最新順になっているか' do
      it { expect(Question.first).to eq questions(:most_recent) }
    end
  end
end
