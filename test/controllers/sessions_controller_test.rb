require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def parent_setup
    @parent = parents(:one)
    session[:user_id] = @parent.id
    session[:user_type] = @parent.user_type
  end

  def nil_setup
    session[:user_id] = nil
    session[:user_type] = nil
  end

  test "should get login if not logged in" do
    nil_setup
    get :login
    assert_response :success
  end

  test "should redirect to root if already logged in" do
    parent_setup
    get :login
    assert_redirected_to root_path
    assert_equal 'You are already logged in. If you want to log in with to ano'\
    'ther profile, you must log out first!', flash[:notice]
  end

  test "should get logout" do
    get :logout
    assert_redirected_to sessions_login_path
  end

end
