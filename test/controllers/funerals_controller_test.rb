require 'test_helper'

class FuneralsControllerTest < ActionController::TestCase
  setup do
    @funeral = funerals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funerals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funeral" do
    assert_difference('Funeral.count') do
      post :create, funeral: { additional_reqs: @funeral.additional_reqs, ashes_location: @funeral.ashes_location, burial_location: @funeral.burial_location, casket_pref: @funeral.casket_pref, donations_to: @funeral.donations_to, dress_code: @funeral.dress_code, epitaph: @funeral.epitaph, final_words: @funeral.final_words, flowers: @funeral.flowers, funeral_pref: @funeral.funeral_pref, other_pref: @funeral.other_pref, readings: @funeral.readings, service_location: @funeral.service_location, songs_pref: @funeral.songs_pref, speakers: @funeral.speakers, user_id: @funeral.user_id, wake: @funeral.wake }
    end

    assert_redirected_to funeral_path(assigns(:funeral))
  end

  test "should show funeral" do
    get :show, id: @funeral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funeral
    assert_response :success
  end

  test "should update funeral" do
    patch :update, id: @funeral, funeral: { additional_reqs: @funeral.additional_reqs, ashes_location: @funeral.ashes_location, burial_location: @funeral.burial_location, casket_pref: @funeral.casket_pref, donations_to: @funeral.donations_to, dress_code: @funeral.dress_code, epitaph: @funeral.epitaph, final_words: @funeral.final_words, flowers: @funeral.flowers, funeral_pref: @funeral.funeral_pref, other_pref: @funeral.other_pref, readings: @funeral.readings, service_location: @funeral.service_location, songs_pref: @funeral.songs_pref, speakers: @funeral.speakers, user_id: @funeral.user_id, wake: @funeral.wake }
    assert_redirected_to funeral_path(assigns(:funeral))
  end

  test "should destroy funeral" do
    assert_difference('Funeral.count', -1) do
      delete :destroy, id: @funeral
    end

    assert_redirected_to funerals_path
  end
end
