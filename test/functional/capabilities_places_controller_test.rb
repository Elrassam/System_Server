require 'test_helper'

class CapabilitiesPlacesControllerTest < ActionController::TestCase
  setup do
    @capabilities_place = capabilities_places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:capabilities_places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capabilities_place" do
    assert_difference('CapabilitiesPlace.count') do
      post :create, capabilities_place: { capability_id: @capabilities_place.capability_id, place_id: @capabilities_place.place_id }
    end

    assert_redirected_to capabilities_place_path(assigns(:capabilities_place))
  end

  test "should show capabilities_place" do
    get :show, id: @capabilities_place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @capabilities_place
    assert_response :success
  end

  test "should update capabilities_place" do
    put :update, id: @capabilities_place, capabilities_place: { capability_id: @capabilities_place.capability_id, place_id: @capabilities_place.place_id }
    assert_redirected_to capabilities_place_path(assigns(:capabilities_place))
  end

  test "should destroy capabilities_place" do
    assert_difference('CapabilitiesPlace.count', -1) do
      delete :destroy, id: @capabilities_place
    end

    assert_redirected_to capabilities_places_path
  end
end
