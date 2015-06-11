require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @parent = parents(:one)
    session[:user_id] = @parent.id
    session[:user_type] = @parent.user_type
  end

  test 'should require login' do
    session[:user_id] = nil
    session[:user_type] = nil
    get :home
    assert_redirected_to sessions_login_path
    assert_equal 'You must log in before accessing this site.', flash[:notice]
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
