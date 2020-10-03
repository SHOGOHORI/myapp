require 'rails_helper'

RSpec.describe User, type: :model do
  it '有効なユーザー' do
    expect( build(:user) ).to be_valid
  end
  describe 'ユーザー名' do
    let(:user) { build(:user, name: name ) }
    subject { user }
    context "ブランクの場合無効" do
      let(:name) { "       " }
      it { is_expected.to_not be_valid }
    end

    context "長過ぎるの場合無効" do
      let(:name) { "a" * 51 }
      it { is_expected.to_not be_valid }
    end
  end

  describe 'メールアドレスのバリデーション(presence,length)' do
    let(:user) { build(:user, email: email ) }
    subject { user }
    context "ブランクの場合無効" do
      let(:email) { "       " }
      it { is_expected.to_not be_valid }
    end

    context "長過ぎるの場合無効" do
      let(:email) { "a" * 244 + "@example.com" }
      it { is_expected.to_not be_valid }
    end
  end

   
  describe 'メールアドレスのバリデーション(正規表現)' do
    it '有効なメールアドレス' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        expect( build(:user, email: valid_address) ).to be_valid
      end
    end

    it '無効なメールアドレス' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      invalid_addresses.each do |invalid_address|
        expect( build(:user, email: invalid_address) ).to_not be_valid
      end
    end
  end

    describe 'メールアドレスの一意性' do
      let!(:user) { create(:user, email: 'user@example.com') }
      it '重複しているメールアドレスは無効' do
        user = build(:user, email: 'user@example.com')
        expect(user).to_not be_valid
      end
    end

    describe 'メールアドレスを小文字で保存する' do
      let!(:user) { create(:user, email: 'ORIGINAL@EXAMPLE.COM') }
      it 'メールアドレスを小文字で保存する' do
        mixed_case_email = user.email
        expect(user.reload.email).to eq mixed_case_email.downcase
      end
    end

  describe "パスワード" do
    let(:user) { build(:user, password: password, 
                       password_confirmation: password_confirmation) }
    subject{ user }

    context "有効なパスワード" do
      let(:password) { "a" * 7 + "A" + "1" + "?" }
      let(:password_confirmation)  { "a" * 7 + "A" + "1" + "?" }
      it { is_expected.to be_valid }
    end

    context "ブランクの場合無効" do
      let(:password) { " " * 10 }
      let(:password_confirmation)  { " " * 10 }
      it { is_expected.to_not be_valid }
    end

    context "短すぎる場合無効" do
      let(:password){ "a" * 6 + "A" + "1" + "?" }
      let(:password_confirmation) { "a" * 6 + "A" + "1" + "?" }
      it { is_expected.to_not be_valid }
    end
 
    context "数字が含まれない場合無効" do
      let(:password){ "a" * 8 + "A" + "?" }
      let(:password_confirmation) { "a" * 8 + "A" + "?" }
      it { is_expected.to_not be_valid }
    end

    context "英大文字が含まれない場合無効" do
      let(:password){ "a" * 8 + "1" + "?" }
      let(:password_confirmation) { "a" * 8 + "1" + "?" }
      it { is_expected.to_not be_valid }
    end

    context "記号が含まれない場合無効" do
      let(:password){ "a" * 8 + "A" + "1" }
      let(:password_confirmation) { "a" * 8 + "A" + "1" }
      it { is_expected.to_not be_valid }
    end

    context "長すぎる場合無効" do
      let(:password) { "a" * 38 + "A" + "1" + "?" }
      let(:password_confirmation) { "a" * 38 + "A" + "1" + "?" }
      it { is_expected.to_not be_valid }
    end

    context "パスワードが一致しない" do
      let(:password) { "a" * 7 + "A" + "1" + "?" }
      let(:password_confirmation) { "b" * 7 + "B" + "1" + "?" }
      it { is_expected.to_not be_valid }
    end  
  end

  it "authenticated?ダイジェストがnilのユーザーにはfalseを返す" do
    user = build(:user)
    expect(user.authenticated?(:remember, '')).to eq false
  end
end
