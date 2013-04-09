require 'test_helper'

class ShowQueriesControllerTest < ActionController::TestCase
  test "should get check_place_status" do
    get :check_place_status
    assert_response :success
  end

  test "should get search_specific_place" do
    get :search_specific_place
    assert_response :success
  end

  test "should get check_place_empty" do
    get :check_place_empty
    assert_response :success
  end

end
