require 'test_helper'

class Admin::DiscsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_discs_new_url
    assert_response :success
  end

end
