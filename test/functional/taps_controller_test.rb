require 'test_helper'

class TapsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get tap" do
    get :tap
    assert_response :success
  end

  test "should get finish" do
    get :finish
    assert_response :success
  end

end
