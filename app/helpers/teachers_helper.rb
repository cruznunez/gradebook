module TeachersHelper

  def already_logged_in?
    session[:user_id] && session[:user_type]
  end

  def is_teacher?
    session[:user_type] == "teacher"
  end

end
