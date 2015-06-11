require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    @teacher = teachers(:one)
  end

  def nil_setup
    session[:user_id] = nil
    session[:user_type] = nil
  end

  def teacher_setup
    session[:user_id] = @teacher.id
    session[:user_type] = @teacher.user_type
  end

  def student_setup
    @student = students(:one)
    session[:user_id] = @student.id
    session[:user_type] = @student.user_type
  end

  def danai
    assert_redirected_to root_path
    assert_equal "ACCESS DANAI'D", flash[:notice]
  end

  test 'should not login' do
    nil_setup
    get :new
    assert_response :success
  end

  test 'should get index' do
    teacher_setup
    get :index
    assert_response :success
    assert_not_nil assigns(:teachers)
  end

  test 'should DANAI index' do
    student_setup
    get :index
    danai
  end

  test 'should get new' do
    teacher_setup
    get :new
    assert_response :success
    student_setup
    get :new
    assert_response :success
  end

  test 'should create teacher and redirect to root as that teacher if not logged in yet' do
    nil_setup
    assert_difference('Teacher.count') do
      post :create, teacher: { email: @teacher.email, name: @teacher.name, password_digest: @teacher.password_digest, user_type: @teacher.user_type }
    end

    assert_redirected_to root_path
    assert_equal session[:user_id], Teacher.last.id
    assert_equal session[:user_type], Teacher.last.user_type
  end

  test 'should create teacher and redirect to root as same teacher if already logged in' do
    teacher_setup
    assert_difference('Teacher.count') do
      post :create, teacher: { email: @teacher.email, name: @teacher.name, password_digest: @teacher.password_digest, user_type: @teacher.user_type }
    end

    assert_redirected_to teachers_path
    assert_equal session[:user_id], @teacher.id
  end

  test 'should DANAI create' do
    student_setup
    post :create, teacher: { email: @teacher.email, name: @teacher.name, password_digest: @teacher.password_digest, user_type: @teacher.user_type }
    danai
  end

  test 'should show teacher' do
    get :show, id: @teacher
    assert_response :success
  end

  test 'should get edit' do
    teacher_setup
    get :edit, id: @teacher
    assert_response :success
  end

  test 'should DANAI edit' do
    nil_setup
    get :edit, id: @teacher
    danai
  end

  test 'should update teacher' do
    teacher_setup
    patch :update, id: @teacher, teacher: { email: @teacher.email, name: @teacher.name, password_digest: @teacher.password_digest, user_type: @teacher.user_type }
    assert_redirected_to teachers_path
  end

  test 'should DANAI update' do
    nil_setup
    patch :update, id: @teacher, teacher: { email: @teacher.email, name: @teacher.name, password_digest: @teacher.password_digest, user_type: @teacher.user_type }
    danai
    student_setup
    patch :update, id: @teacher, teacher: { email: @teacher.email, name: @teacher.name, password_digest: @teacher.password_digest, user_type: @teacher.user_type }
    danai
  end

  test 'should destroy teacher' do
    teacher_setup
    assert_difference('Teacher.count', -1) do
      delete :destroy, id: @teacher
    end

    assert_redirected_to teachers_path
  end

  test 'should DANAI destroy' do
    student_setup
    delete :destroy, id: @teacher

    danai
  end
end
