require 'test_helper'
require 'minitest/pride'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
    session[:user_id] = @student.id
    session[:user_type] = @student.user_type
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { email: @student.email, name: @student.name, password_digest: @student.password_digest, teacher_id: @student.teacher_id, user_type: @student.user_type }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { email: @student.email, name: @student.name, password_digest: @student.password_digest, teacher_id: @student.teacher_id, user_type: @student.user_type }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
