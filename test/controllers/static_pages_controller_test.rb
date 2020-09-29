require 'test_helper'
#RSpecへ移行済み
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "育児Q&A"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "育児Q&A"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "育児Q&A"
  end

end
