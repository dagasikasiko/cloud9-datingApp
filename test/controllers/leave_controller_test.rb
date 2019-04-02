require 'test_helper'

class LeaveControllerTest < ActionDispatch::IntegrationTest
  test "should get goodbye" do
    get leave_goodbye_url
    assert_response :success
  end

  test "should get thankyou" do
    get leave_thankyou_url
    assert_response :success
  end

end
