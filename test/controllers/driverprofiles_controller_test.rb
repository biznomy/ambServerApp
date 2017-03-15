require 'test_helper'

class DriverprofilesControllerTest < ActionController::TestCase
  setup do
    @driverprofile = driverprofiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:driverprofiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driverprofile" do
    assert_difference('Driverprofile.count') do
      post :create, driverprofile: { name: @driverprofile.name }
    end

    assert_redirected_to driverprofile_path(assigns(:driverprofile))
  end

  test "should show driverprofile" do
    get :show, id: @driverprofile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driverprofile
    assert_response :success
  end

  test "should update driverprofile" do
    patch :update, id: @driverprofile, driverprofile: { name: @driverprofile.name }
    assert_redirected_to driverprofile_path(assigns(:driverprofile))
  end

  test "should destroy driverprofile" do
    assert_difference('Driverprofile.count', -1) do
      delete :destroy, id: @driverprofile
    end

    assert_redirected_to driverprofiles_path
  end
end
