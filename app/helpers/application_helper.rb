module ApplicationHelper
  private def logged_in?
      if session[:user_id] && session[:user_type]
        return true
      else
        redirect_to sessions_login_path, notice: 'You must log in before accessing this site.'
      end
  end
end
