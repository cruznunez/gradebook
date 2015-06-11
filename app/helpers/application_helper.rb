module ApplicationHelper
  private

  def logged_in?
    unless session[:user_id] && session[:user_type]
      redirect_to sessions_login_path, notice: 'You must log in before accessing this site.'
    end
  end

  def already_logged_in?
    session[:user_id] && session[:user_type]
  end

  def teacher?
    unless session[:user_type] == "teacher"
      redirect_to root_path, notice: "ACCESS DANAI'D"
    end
    true
  end
end
