require 'test_helper'

class AdminMerchantControllerTest < ActionController::TestCase
  test "should get controller" do
    get :controller
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
