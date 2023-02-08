require "test_helper"

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_show_url
    assert_response :success
  end

  test "should get new" do
    get customer_new_url
    assert_response :success
  end

  test "should get details" do
    get customer_details_url
    assert_response :success
  end

  test "should get checkout" do
    get customer_checkout_url
    assert_response :success
  end
end
