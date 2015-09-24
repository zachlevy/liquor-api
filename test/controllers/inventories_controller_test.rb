require 'test_helper'

class InventoriesControllerTest < ActionController::TestCase
  setup do
    @inventory = inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventories)
  end

  test "should create inventory" do
    assert_difference('Inventory.count') do
      post :create, inventory: { lcbo_updated_at: @inventory.lcbo_updated_at, lcbo_updated_on: @inventory.lcbo_updated_on, product_id: @inventory.product_id, quantity: @inventory.quantity, sales: @inventory.sales, shipment: @inventory.shipment, store_id: @inventory.store_id }
    end

    assert_response 201
  end

  test "should show inventory" do
    get :show, id: @inventory
    assert_response :success
  end

  test "should update inventory" do
    put :update, id: @inventory, inventory: { lcbo_updated_at: @inventory.lcbo_updated_at, lcbo_updated_on: @inventory.lcbo_updated_on, product_id: @inventory.product_id, quantity: @inventory.quantity, sales: @inventory.sales, shipment: @inventory.shipment, store_id: @inventory.store_id }
    assert_response 204
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete :destroy, id: @inventory
    end

    assert_response 204
  end
end
