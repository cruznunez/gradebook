module ApplicationHelper
  private def logged_in?
      if Teacher.find_by_id(session[:user_id])
        return true
      else
        redirect_to sessions_login_path, notice: 'You must log in before seeing a teacher list.'
      end
  end
end
