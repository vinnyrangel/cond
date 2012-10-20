require 'test_helper'

class MuraisControllerTest < ActionController::TestCase
  setup do
    @mural = murais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:murais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mural" do
    assert_difference('Mural.count') do
      post :create, mural: @mural.attributes
    end

    assert_redirected_to mural_path(assigns(:mural))
  end

  test "should show mural" do
    get :show, id: @mural.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mural.to_param
    assert_response :success
  end

  test "should update mural" do
    put :update, id: @mural.to_param, mural: @mural.attributes
    assert_redirected_to mural_path(assigns(:mural))
  end

  test "should destroy mural" do
    assert_difference('Mural.count', -1) do
      delete :destroy, id: @mural.to_param
    end

    assert_redirected_to murais_path
  end
end
