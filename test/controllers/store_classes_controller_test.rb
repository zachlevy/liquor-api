require 'test_helper'

class StoreClassesControllerTest < ActionController::TestCase
  setup do
    @store_class = store_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_classes)
  end

  test "should create store_class" do
    assert_difference('StoreClass.count') do
      post :create, store_class: { name: @store_class.name }
    end

    assert_response 201
  end

  test "should show store_class" do
    get :show, id: @store_class
    assert_response :success
  end

  test "should update store_class" do
    put :update, id: @store_class, store_class: { name: @store_class.name }
    assert_response 204
  end

  test "should destroy store_class" do
    assert_difference('StoreClass.count', -1) do
      delete :destroy, id: @store_class
    end

    assert_response 204
  end
end
