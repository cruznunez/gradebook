require 'test_helper'

class GradesControllerTest < ActionController::TestCase
  setup do
    @grade = grades(:one)
    @student = students(:one)
    @teacher = teachers(:one)
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
    assert_not_nil assigns(:grades)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create grade' do
    assert_difference('Grade.count') do
      post :create, grade: { assignment_name: @grade.assignment_name, student_id: @grade.student_id, value: @grade.value }
    end

    assert_redirected_to grades_path
  end

  test 'should DANAI create if user is not teacher' do
    session[:user_id] = @student.id
    session[:user_type] = @student.user_type
    post :create, grade: { assignment_name: @grade.assignment_name, student_id: @grade.student_id, value: @grade.value }

    assert_redirected_to root_path
    assert_equal "ACCESS DANAI'D", flash[:notice]
  end

  test 'should show' do
    get :show, id: @grade
    assert_response :success
  end

  test 'should edit' do
    get :edit, id: @grade
    assert_response :success
  end

  test 'should DANAI edit' do
    session[:user_id] = @student.id
    session[:user_type] = @student.user_type
    get :edit, id: @grade
    assert_redirected_to root_path
    assert_equal "ACCESS DANAI'D", flash[:notice]
  end

  test 'should update' do
    patch :update, id: @grade, grade: { assignment_name: @grade.assignment_name, student_id: @grade.student_id, value: @grade.value }
    assert_redirected_to grade_path(assigns(:grade))
  end

  test 'should DANAI update' do
    session[:user_id] = @student.id
    session[:user_type] = @student.user_type
    patch :update, id: @grade, grade: { assignment_name: @grade.assignment_name, student_id: @grade.student_id, value: @grade.value }
    assert_redirected_to root_path
    assert_equal "ACCESS DANAI'D", flash[:notice]
  end

  test 'should destroy grade' do
    assert_difference('Grade.count', -1) do
      delete :destroy, id: @grade
    end

    assert_redirected_to grades_path
  end

  test 'should DANAI destroy' do
    session[:user_id] = @student.id
    session[:user_type] = @student.user_type
    delete :destroy, id: @grade
    assert_redirected_to root_path
    assert_equal "ACCESS DANAI'D", flash[:notice]
  end
end
