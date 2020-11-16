module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def teacher_user?
    if logged_in?
      Teacher.exists?(user_id: session[:user_id])
    end
  end

  def student_user?
    if logged_in?
      Student.exists?(User_id: session[:user_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

 # Logs out the current user.
  def log_out
    reset_session
    @current_user = nil
  end
end
