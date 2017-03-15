require 'test_helper'

class BookingAddonsControllerTest < ActionController::TestCase
  setup do
    @booking_addon = booking_addons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_addons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_addon" do
    assert_difference('BookingAddon.count') do
      post :create, booking_addon: {  }
    end

    assert_redirected_to booking_addon_path(assigns(:booking_addon))
  end

  test "should show booking_addon" do
    get :show, id: @booking_addon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_addon
    assert_response :success
  end

  test "should update booking_addon" do
    patch :update, id: @booking_addon, booking_addon: {  }
    assert_redirected_to booking_addon_path(assigns(:booking_addon))
  end

  test "should destroy booking_addon" do
    assert_difference('BookingAddon.count', -1) do
      delete :destroy, id: @booking_addon
    end

    assert_redirected_to booking_addons_path
  end
end
