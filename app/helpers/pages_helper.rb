module PagesHelper
  private def logged_in?
    if session[:user_id] && session[:user_type]
      redirect_to root_path, notice: 'You are already logged in. If you want t'\
      'o log in with to another profile, you must log out first!'
    end
  end
end
