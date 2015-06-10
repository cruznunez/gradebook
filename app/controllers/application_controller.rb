class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_user



  private def set_user
    if session[:user_id]
      if session[:user_type] == "teacher"
        @user = Teacher.find(session[:user_id])
      elsif session[:user_type] == "student"
        @user = Student.find(session[:user_id])
      elsif session[:user_type] == "parent"
        @user = Parent.find(session[:user_id])
      end
    else
      nil
    end
  end
end
