require 'test_helper'

class IsseYsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issey = isseys(:one)
  end

  test "should get index" do
    get isseys_url
    assert_response :success
  end

  test "should get new" do
    get new_issey_url
    assert_response :success
  end

  test "should create issey" do
    assert_difference('Issey.count') do
      post isseys_url, params: { issey: { age: @issey.age, grade: @issey.grade, name: @issey.name, pass: @issey.pass, point: @issey.point, profile: @issey.profile, userid: @issey.userid } }
    end

    assert_redirected_to issey_url(Issey.last)
  end

  test "should show issey" do
    get issey_url(@issey)
    assert_response :success
  end

  test "should get edit" do
    get edit_issey_url(@issey)
    assert_response :success
  end

  test "should update issey" do
    patch issey_url(@issey), params: { issey: { age: @issey.age, grade: @issey.grade, name: @issey.name, pass: @issey.pass, point: @issey.point, profile: @issey.profile, userid: @issey.userid } }
    assert_redirected_to issey_url(@issey)
  end

  test "should destroy issey" do
    assert_difference('Issey.count', -1) do
      delete issey_url(@issey)
    end

    assert_redirected_to isseys_url
  end
end
