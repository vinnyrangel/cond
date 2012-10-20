require 'test_helper'

class CondominiaControllerTest < ActionController::TestCase
  setup do
    @condominios = condominio(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:condominio)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create condominios" do
    assert_difference('Condominium.count') do
      post :create, condominios: @condominios.attributes
    end

    assert_redirected_to condominium_path(assigns(:condominios))
  end

  test "should show condominios" do
    get :show, id: @condominios.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @condominios.to_param
    assert_response :success
  end

  test "should update condominios" do
    put :update, id: @condominios.to_param, condominios: @condominios.attributes
    assert_redirected_to condominium_path(assigns(:condominios))
  end

  test "should destroy condominios" do
    assert_difference('Condominium.count', -1) do
      delete :destroy, id: @condominios.to_param
    end

    assert_redirected_to condominia_path
  end
end
