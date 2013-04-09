require 'test_helper'

class PlaceHasCapsControllerTest < ActionController::TestCase
  setup do
    @place_has_cap = place_has_caps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:place_has_caps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create place_has_cap" do
    assert_difference('PlaceHasCap.count') do
      post :create, place_has_cap: { capability_id: @place_has_cap.capability_id, place_id: @place_has_cap.place_id }
    end

    assert_redirected_to place_has_cap_path(assigns(:place_has_cap))
  end

  test "should show place_has_cap" do
    get :show, id: @place_has_cap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @place_has_cap
    assert_response :success
  end

  test "should update place_has_cap" do
    put :update, id: @place_has_cap, place_has_cap: { capability_id: @place_has_cap.capability_id, place_id: @place_has_cap.place_id }
    assert_redirected_to place_has_cap_path(assigns(:place_has_cap))
  end

  test "should destroy place_has_cap" do
    assert_difference('PlaceHasCap.count', -1) do
      delete :destroy, id: @place_has_cap
    end

    assert_redirected_to place_has_caps_path
  end
end
