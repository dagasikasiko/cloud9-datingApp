require 'test_helper'

class MessageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messages_index_url
    assert_response :success
  end

end
