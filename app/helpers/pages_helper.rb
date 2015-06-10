module PagesHelper
  private def logged_in?
    if Teacher.find_by_id(session[:user_id])
      redirect_to root_path
    end
  end
end
