require 'test_helper'

class StuffControllerTest < ActionController::TestCase
  setup do
    @stuff = stuff(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stuff)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stuff" do
    assert_difference('Stuff.count') do
      post :create, stuff: { description: @stuff.description, name: @stuff.name, user_id: @stuff.user_id }
    end

    assert_redirected_to stuff_path(assigns(:stuff))
  end

  test "should show stuff" do
    get :show, id: @stuff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stuff
    assert_response :success
  end

  test "should update stuff" do
    put :update, id: @stuff, stuff: { description: @stuff.description, name: @stuff.name, user_id: @stuff.user_id }
    assert_redirected_to stuff_path(assigns(:stuff))
  end

  test "should destroy stuff" do
    assert_difference('Stuff.count', -1) do
      delete :destroy, id: @stuff
    end

    assert_redirected_to stuff_index_path
  end
end
