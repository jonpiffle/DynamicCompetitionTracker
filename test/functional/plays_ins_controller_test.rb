require 'test_helper'

class PlaysInsControllerTest < ActionController::TestCase
  setup do
    @plays_in = plays_ins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plays_ins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plays_in" do
    assert_difference('PlaysIn.count') do
      post :create, :plays_in => { :game_id => @plays_in.game_id, :team_id => @plays_in.team_id, :won => @plays_in.won }
    end

    assert_redirected_to plays_in_path(assigns(:plays_in))
  end

  test "should show plays_in" do
    get :show, :id => @plays_in
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @plays_in
    assert_response :success
  end

  test "should update plays_in" do
    put :update, :id => @plays_in, :plays_in => { :game_id => @plays_in.game_id, :team_id => @plays_in.team_id, :won => @plays_in.won }
    assert_redirected_to plays_in_path(assigns(:plays_in))
  end

  test "should destroy plays_in" do
    assert_difference('PlaysIn.count', -1) do
      delete :destroy, :id => @plays_in
    end

    assert_redirected_to plays_ins_path
  end
end
