require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test 'should get view' do
    get post_view_url
    assert_response :success
  end
end
