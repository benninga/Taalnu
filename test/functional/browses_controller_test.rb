require 'test_helper'

class BrowsesControllerTest < ActionController::TestCase
  setup do
    @browse = browses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:browses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create browse" do
    assert_difference('Browse.count') do
      post :create, browse: { content: @browse.content, name: @browse.name }
    end

    assert_redirected_to browse_path(assigns(:browse))
  end

  test "should show browse" do
    get :show, id: @browse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @browse
    assert_response :success
  end

  test "should update browse" do
    put :update, id: @browse, browse: { content: @browse.content, name: @browse.name }
    assert_redirected_to browse_path(assigns(:browse))
  end

  test "should destroy browse" do
    assert_difference('Browse.count', -1) do
      delete :destroy, id: @browse
    end

    assert_redirected_to browses_path
  end
end
