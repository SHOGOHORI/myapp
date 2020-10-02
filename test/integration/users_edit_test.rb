require 'test_helper'
#フレンドリーフォワーディング以外RSpecに移行済み
class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
  end

  test "有効でない編集" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
    assert_select "div.alert", "4箇所の入力誤りが発生しています"
  end

  test "有効な編集、フレンドリーフォワーディング" do
    get edit_user_path(@user)
    assert_equal session[:forwarding_url], edit_user_url(@user) 
    log_in_as(@user)
    assert_nil session[:forwarding_url] 
    assert_redirected_to edit_user_url(@user)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
end
