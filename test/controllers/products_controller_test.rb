require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { case_size: @product.case_size, name: @product.name, number: @product.number }
    end

    assert_response 201
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { case_size: @product.case_size, name: @product.name, number: @product.number }
    assert_response 204
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_response 204
  end
end
