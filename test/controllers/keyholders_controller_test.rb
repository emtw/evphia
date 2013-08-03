require 'test_helper'

class KeyholdersControllerTest < ActionController::TestCase
  setup do
    @keyholder = keyholders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keyholders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keyholder" do
    assert_difference('Keyholder.count') do
      post :create, keyholder: { first_name: @keyholder.first_name, house: @keyholder.house, last_name: @keyholder.last_name, postcode: @keyholder.postcode, user_id: @keyholder.user_id, username: @keyholder.username }
    end

    assert_redirected_to keyholder_path(assigns(:keyholder))
  end

  test "should show keyholder" do
    get :show, id: @keyholder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keyholder
    assert_response :success
  end

  test "should update keyholder" do
    patch :update, id: @keyholder, keyholder: { first_name: @keyholder.first_name, house: @keyholder.house, last_name: @keyholder.last_name, postcode: @keyholder.postcode, user_id: @keyholder.user_id, username: @keyholder.username }
    assert_redirected_to keyholder_path(assigns(:keyholder))
  end

  test "should destroy keyholder" do
    assert_difference('Keyholder.count', -1) do
      delete :destroy, id: @keyholder
    end

    assert_redirected_to keyholders_path
  end
end
