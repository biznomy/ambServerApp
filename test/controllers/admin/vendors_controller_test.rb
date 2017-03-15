require 'test_helper'

class Admin::VendorsControllerTest < ActionController::TestCase
  setup do
    @admin_vendor = admin_vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_vendor" do
    assert_difference('Admin::Vendor.count') do
      post :create, admin_vendor: { name: @admin_vendor.name }
    end

    assert_redirected_to admin_vendor_path(assigns(:admin_vendor))
  end

  test "should show admin_vendor" do
    get :show, id: @admin_vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_vendor
    assert_response :success
  end

  test "should update admin_vendor" do
    patch :update, id: @admin_vendor, admin_vendor: { name: @admin_vendor.name }
    assert_redirected_to admin_vendor_path(assigns(:admin_vendor))
  end

  test "should destroy admin_vendor" do
    assert_difference('Admin::Vendor.count', -1) do
      delete :destroy, id: @admin_vendor
    end

    assert_redirected_to admin_vendors_path
  end
end
