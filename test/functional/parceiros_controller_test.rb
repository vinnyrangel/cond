require 'test_helper'

class ParceirosControllerTest < ActionController::TestCase
  setup do
    @parceiro = parceiros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parceiros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parceiro" do
    assert_difference('Parceiro.count') do
      post :create, parceiro: @parceiro.attributes
    end

    assert_redirected_to parceiro_path(assigns(:parceiro))
  end

  test "should show parceiro" do
    get :show, id: @parceiro.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parceiro.to_param
    assert_response :success
  end

  test "should update parceiro" do
    put :update, id: @parceiro.to_param, parceiro: @parceiro.attributes
    assert_redirected_to parceiro_path(assigns(:parceiro))
  end

  test "should destroy parceiro" do
    assert_difference('Parceiro.count', -1) do
      delete :destroy, id: @parceiro.to_param
    end

    assert_redirected_to parceiros_path
  end
end
