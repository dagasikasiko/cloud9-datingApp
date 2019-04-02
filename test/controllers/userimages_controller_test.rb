require 'test_helper'

class UserimagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userimage = userimages(:one)
  end

  test "should get index" do
    get userimages_url
    assert_response :success
  end

  test "should get new" do
    get new_userimage_url
    assert_response :success
  end

  test "should create userimage" do
    assert_difference('Userimage.count') do
      post userimages_url, params: { userimage: { user_id: @userimage.user_id } }
    end

    assert_redirected_to userimage_url(Userimage.last)
  end

  test "should show userimage" do
    get userimage_url(@userimage)
    assert_response :success
  end

  test "should get edit" do
    get edit_userimage_url(@userimage)
    assert_response :success
  end

  test "should update userimage" do
    patch userimage_url(@userimage), params: { userimage: { user_id: @userimage.user_id } }
    assert_redirected_to userimage_url(@userimage)
  end

  test "should destroy userimage" do
    assert_difference('Userimage.count', -1) do
      delete userimage_url(@userimage)
    end

    assert_redirected_to userimages_url
  end
end
