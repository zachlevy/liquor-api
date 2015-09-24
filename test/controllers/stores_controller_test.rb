require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  setup do
    @store = stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  test "should create store" do
    assert_difference('Store.count') do
      post :create, store: { address: @store.address, city: @store.city, dead: @store.dead, fax: @store.fax, lat: @store.lat, lcbo_updated_at: @store.lcbo_updated_at, lng: @store.lng, name: @store.name, number: @store.number, phone: @store.phone, postal_code: @store.postal_code, store_class_id: @store.store_class_id }
    end

    assert_response 201
  end

  test "should show store" do
    get :show, id: @store
    assert_response :success
  end

  test "should update store" do
    put :update, id: @store, store: { address: @store.address, city: @store.city, dead: @store.dead, fax: @store.fax, lat: @store.lat, lcbo_updated_at: @store.lcbo_updated_at, lng: @store.lng, name: @store.name, number: @store.number, phone: @store.phone, postal_code: @store.postal_code, store_class_id: @store.store_class_id }
    assert_response 204
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete :destroy, id: @store
    end

    assert_response 204
  end
end
