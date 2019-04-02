require 'test_helper'

class StampimagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stampimage = stampimages(:one)
  end

  test "should get index" do
    get stampimages_url
    assert_response :success
  end

  test "should get new" do
    get new_stampimage_url
    assert_response :success
  end

  test "should create stampimage" do
    assert_difference('Stampimage.count') do
      post stampimages_url, params: { stampimage: { name: @stampimage.name, rate: @stampimage.rate } }
    end

    assert_redirected_to stampimage_url(Stampimage.last)
  end

  test "should show stampimage" do
    get stampimage_url(@stampimage)
    assert_response :success
  end

  test "should get edit" do
    get edit_stampimage_url(@stampimage)
    assert_response :success
  end

  test "should update stampimage" do
    patch stampimage_url(@stampimage), params: { stampimage: { name: @stampimage.name, rate: @stampimage.rate } }
    assert_redirected_to stampimage_url(@stampimage)
  end

  test "should destroy stampimage" do
    assert_difference('Stampimage.count', -1) do
      delete stampimage_url(@stampimage)
    end

    assert_redirected_to stampimages_url
  end
end
