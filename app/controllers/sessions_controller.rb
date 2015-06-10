class SessionsController < ApplicationController
  include PagesHelper
  before_action :logged_in?, only: [:login]

  def login
    if request.post?
      if Teacher.find_by_email(params[:email])
        user_id = Teacher.find_by_email(params[:email]).id
        type = "teacher"
      elsif Student.find_by_email(params[:email])
        user_id = Student.find_by_email(params[:email]).id
        type = "student"
      elsif Parent.find_by_email(params[:email])
        user_id = Parent.find_by_email(params[:email]).id
        type = "parent"
      else
        flash.now[:notice] = "ACCESS DENIED"
      end
      session[:user_id] = user_id
      session[:user_type] = type
      redirect_to root_path, notice: "Log in successful."
    end
    @teachers = Teacher.all
  end

  def logout
    session[:user_id] = nil
    redirect_to sessions_login_path, notice: "Log out successful."
  end
end
