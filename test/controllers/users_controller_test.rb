require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { contact_number: @user.contact_number, county: @user.county, date_of_birth: @user.date_of_birth, first_name: @user.first_name, gender: @user.gender, guest_id: @user.guest_id, keyholder_id: @user.keyholder_id, last_name: @user.last_name, line_1: @user.line_1, line_2: @user.line_2, line_3: @user.line_3, middle_names: @user.middle_names, postcode: @user.postcode, town: @user.town, username: @user.username }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { contact_number: @user.contact_number, county: @user.county, date_of_birth: @user.date_of_birth, first_name: @user.first_name, gender: @user.gender, guest_id: @user.guest_id, keyholder_id: @user.keyholder_id, last_name: @user.last_name, line_1: @user.line_1, line_2: @user.line_2, line_3: @user.line_3, middle_names: @user.middle_names, postcode: @user.postcode, town: @user.town, username: @user.username }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
