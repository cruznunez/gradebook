class SessionsController < ApplicationController
  before_action :logged_in?, only: [:login]

  private def logged_in?
      if Teacher.find_by_id(session[:user_id])
        redirect_to root_path
      end
  end

  def login
    if request.post?
      teacher = Teacher.find_by_email(params[:email])
      if teacher && teacher.authenticate(params[:password_digest])
        session[:user_id] = teacher.id
        redirect_to root_path, notice: "Log in successful."
      else
        flash.now[:notice] = "Invalid password"
      end
    end
    @teachers = Teacher.all
  end

  def logout
    session[:user_id] = nil
    redirect_to sessions_login_path, notice: "Log out successful."
  end
end
