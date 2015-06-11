require 'test_helper'

class ParentsControllerTest < ActionController::TestCase
  setup do
    @parent = parents(:one)
    @teacher = teachers(:one)
    session[:user_id] = @parent.id
    session[:user_type] = @parent.user_type
  end

  def danai
    assert_redirected_to root_path
    assert_equal "ACCESS DANAI'D", flash[:notice]
  end

  def teacher_setup
    session[:user_id] = @teacher.id
    session[:user_type] = @teacher.user_type
  end

  test 'should require login' do
    session[:user_id] = nil
    session[:user_type] = nil
    get :new
    assert_redirected_to sessions_login_path
    assert_equal 'You must log in before accessing this site.', flash[:notice]
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:parents)
  end

  test 'should get new' do
    teacher_setup
    get :new
    assert_response :success
  end

  test 'should DANAI new' do
    get :new
    danai
  end

  test 'should create' do
    session[:user_id] = @teacher.id
    session[:user_type] = @teacher.user_type
    assert_difference('Parent.count') do
      post :create, parent: { email: @parent.email, name: @parent.name, password_digest: @parent.password_digest, student_id: @parent.student_id, user_type: @parent.user_type }
    end

    assert_redirected_to parents_path
  end

  test 'should DANAI create' do
    post :create, parent: { email: @parent.email, name: @parent.name, password_digest: @parent.password_digest, student_id: @parent.student_id, user_type: @parent.user_type }
    danai
  end

  test 'should show parent' do
    get :show, id: @parent
    assert_response :success
  end

  test 'should get edit' do
    teacher_setup
    get :edit, id: @parent
    assert_response :success
  end

  test 'should DANAI edit' do
    get :edit, id: @parent
    danai
  end

  test 'should update parent' do
    teacher_setup
    patch :update, id: @parent, parent: { email: @parent.email, name: @parent.name, password_digest: @parent.password_digest, student_id: @parent.student_id, user_type: @parent.user_type }
    assert_redirected_to parents_path
  end

  test 'should DANAI parent' do
    patch :update, id: @parent, parent: { email: @parent.email, name: @parent.name, password_digest: @parent.password_digest, student_id: @parent.student_id, user_type: @parent.user_type }
    danai
  end

  test 'should destroy parent' do
    teacher_setup
    assert_difference('Parent.count', -1) do
      delete :destroy, id: @parent
    end

    assert_redirected_to parents_path
  end

  test 'should DANAI destroy' do
    delete :destroy, id: @parent
    danai
  end
end
