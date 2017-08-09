require 'test_helper'

class HomelessesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homelesses_index_url
    assert_response :success
  end

end
