require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @hangout = hangouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hangouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hangout" do
    assert_difference('Session.count') do
      post :create, :hangout => { :league_id => @hangout.league_id }
    end

    assert_redirected_to hangout_path(assigns(:hangout))
  end

  test "should show hangout" do
    get :show, :id => @hangout
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hangout
    assert_response :success
  end

  test "should update hangout" do
    put :update, :id => @hangout, :hangout => { :league_id => @hangout.league_id }
    assert_redirected_to hangout_path(assigns(:hangout))
  end

  test "should destroy hangout" do
    assert_difference('Session.count', -1) do
      delete :destroy, :id => @hangout
    end

    assert_redirected_to hangouts_path
  end
end
