require 'test_helper'

class KegsControllerTest < ActionController::TestCase
  setup do
    @keg = kegs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kegs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keg" do
    assert_difference('Keg.count') do
      post :create, keg: { beer_guid: @keg.beer_guid, end_date: @keg.end_date, name: @keg.name, start_date: @keg.start_date }
    end

    assert_redirected_to keg_path(assigns(:keg))
  end

  test "should show keg" do
    get :show, id: @keg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keg
    assert_response :success
  end

  test "should update keg" do
    put :update, id: @keg, keg: { beer_guid: @keg.beer_guid, end_date: @keg.end_date, name: @keg.name, start_date: @keg.start_date }
    assert_redirected_to keg_path(assigns(:keg))
  end

  test "should destroy keg" do
    assert_difference('Keg.count', -1) do
      delete :destroy, id: @keg
    end

    assert_redirected_to kegs_path
  end
end
