require 'test_helper'

class ItemComprasControllerTest < ActionController::TestCase
  setup do
    @item_compra = item_compras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_compras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_compra" do
    assert_difference('ItemCompra.count') do
      post :create, item_compra: { preco: @item_compra.preco, quantidade: @item_compra.quantidade }
    end

    assert_redirected_to item_compra_path(assigns(:item_compra))
  end

  test "should show item_compra" do
    get :show, id: @item_compra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_compra
    assert_response :success
  end

  test "should update item_compra" do
    put :update, id: @item_compra, item_compra: { preco: @item_compra.preco, quantidade: @item_compra.quantidade }
    assert_redirected_to item_compra_path(assigns(:item_compra))
  end

  test "should destroy item_compra" do
    assert_difference('ItemCompra.count', -1) do
      delete :destroy, id: @item_compra
    end

    assert_redirected_to item_compras_path
  end
end
