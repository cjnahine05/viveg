require 'test_helper'

class SplashscreensControllerTest < ActionController::TestCase
  setup do
    @splashscreen = splashscreens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:splashscreens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create splashscreen" do
    assert_difference('Splashscreen.count') do
      post :create, splashscreen: { name: @splashscreen.name, video: @splashscreen.video }
    end

    assert_redirected_to splashscreen_path(assigns(:splashscreen))
  end

  test "should show splashscreen" do
    get :show, id: @splashscreen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @splashscreen
    assert_response :success
  end

  test "should update splashscreen" do
    patch :update, id: @splashscreen, splashscreen: { name: @splashscreen.name, video: @splashscreen.video }
    assert_redirected_to splashscreen_path(assigns(:splashscreen))
  end

  test "should destroy splashscreen" do
    assert_difference('Splashscreen.count', -1) do
      delete :destroy, id: @splashscreen
    end

    assert_redirected_to splashscreens_path
  end
end
