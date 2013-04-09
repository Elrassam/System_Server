require 'test_helper'

class CapabilitiesPlacesControllerControllerTest < ActionController::TestCase
  test "should get capability_id:integer" do
    get :capability_id:integer
    assert_response :success
  end

  test "should get place_id:integer" do
    get :place_id:integer
    assert_response :success
  end

end
