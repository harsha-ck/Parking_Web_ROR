require "test_helper"

class SpotControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spots_url
    assert_response :success
  end

#   test "should get show" do
#     get spots_show_url
#     assert_response :success
#   end

  test "should get new" do
    get new_spot_url
    assert_response :success
  end

#   test "should get edit" do
#     get spots_edit_url
#     assert_response :success
#   end
end
