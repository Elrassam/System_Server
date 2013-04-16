require 'test_helper'

class QueriesControllerTest < ActionController::TestCase
  test "should get edit_q" do
    get :edit_q
    assert_response :success
  end

end
