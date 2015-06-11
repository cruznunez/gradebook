require 'test_helper'
require 'minitest/pride'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  def nil_setup
    session[:user_id] = nil
    session[:user_type] = nil
  end

  def teacher_setup
    @teacher = teachers(:one)
    session[:user_id] = @teacher.id
    session[:user_type] = @teacher.user_type
  end

  def student_setup
    session[:user_id] = @student.id
    session[:user_type] = @student.user_type
  end

  def danai
    assert_redirected_to root_path
    assert_equal "ACCESS DANAI'D", flash[:notice]
  end

  test 'should require login' do
    nil_setup
    get :new
    assert_redirected_to sessions_login_path
    assert_equal 'You must log in before accessing this site.', flash[:notice]
  end

  test 'should DANAI index' do
    student_setup
    get :index
    danai
  end

  test 'should get index' do
    teacher_setup
    get :index
    assert_response :success
  end

  test 'should get new' do
    teacher_setup
    get :new
    assert_response :success
  end

  test 'should DANAI new' do
    student_setup
    get :new
    danai
  end

  test 'should create student' do
    teacher_setup
    assert_difference('Student.count') do
      post :create, student: { email: @student.email, name: @student.name, password_digest: @student.password_digest, teacher_id: @student.teacher_id, user_type: @student.user_type }
    end

    assert_redirected_to students_path
  end

  test 'should DANAI create' do
    student_setup
    post :create, student: { email: @student.email, name: @student.name, password_digest: @student.password_digest, teacher_id: @student.teacher_id, user_type: @student.user_type }
    danai
  end

  test 'should show student' do
    teacher_setup
    get :show, id: @student
    assert_response :success
  end

  test 'should DANAI show' do
    student_setup
    get :show, id: @student
    danai
  end

  test 'should get edit' do
    teacher_setup
    get :edit, id: @student
    assert_response :success
  end

  test 'should DANAI edit' do
    student_setup
    get :edit, id: @student
    danai
  end

  test 'should update student' do
    teacher_setup
    patch :update, id: @student, student: { email: @student.email, name: @student.name, password_digest: @student.password_digest, teacher_id: @student.teacher_id, user_type: @student.user_type }
    assert_redirected_to students_path
  end

  test 'should DANAI update' do
    student_setup
    patch :update, id: @student, student: { email: @student.email, name: @student.name, password_digest: @student.password_digest, teacher_id: @student.teacher_id, user_type: @student.user_type }
    danai
  end

  test 'should destroy student' do
    teacher_setup
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end
    assert_redirected_to students_path
  end

  test 'should DANAI destroy' do
    student_setup
    delete :destroy, id: @student
    danai
  end
end
