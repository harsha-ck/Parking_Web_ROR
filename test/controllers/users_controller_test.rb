require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_users_url
    assert_response :success
  end

#   test "should get edit" do
#     get users_edit_url
#     assert_response :success
#   end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get login" do
    get login_url
    assert_response :success
  end

#   test "should get show" do
#     get users_show_url
#     assert_response :success
#   end
end
