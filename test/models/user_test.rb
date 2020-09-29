require 'test_helper'
#RSpecに移行済み
class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "a" * 7 + "A" + "1" + "?", password_confirmation: "a" * 7 + "A" + "1" + "?")
  end

  test "ユーザーが有効かどうか" do
    assert @user.valid?
  end

  test "ユーザー名がブランクの場合無効な状態であること" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "メールアドレスがブランクの場合無効な状態であること" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "ユーザー名が長すぎる場合無効な状態であること" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "メールアドレスが長すぎる場合無効な状態であること" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "有効なメールアドレス" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_not @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "無効なメールアドレス" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "メールアドレスが重複している場合無効な状態であること" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "メールアドレスを小文字で保存する" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "パスワードがブランクの場合無効な状態であること" do
    @user.password = @user.password_confirmation = " " * 10
    assert_not @user.valid?
  end

  test "パスワードが短い場合無効な状態であること" do
    @user.password = @user.password_confirmation = "a" * 6 + "A" + "1" + "?"
    assert_not @user.valid?
  end

  test "パスワードに数字が含まれない場合無効な状態であること" do
    @user.password = @user.password_confirmation = "a" * 8 + "A" + "?"
    assert_not @user.valid?
  end

  test "パスワードに英大文字が含まれない場合無効な状態であること" do
    @user.password = @user.password_confirmation = "a" * 8 + "1" + "?"
    assert_not @user.valid?
  end

  test "パスワードに記号が含まれない場合無効な状態であること" do
    @user.password = @user.password_confirmation = "a" * 8 + "A" + "1"
    assert_not @user.valid?
  end

  test "パスワードが長すぎる場合無効な状態であること" do
    @user.password = @user.password_confirmation = c
    assert_not @user.valid?
  end

  test "authenticated?ダイジェストがnilのユーザーにはfalseを返す" do
    assert_not @user.authenticated?('')
  end

end
