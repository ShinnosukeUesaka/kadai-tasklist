module SessionsHelper
  # does it have to be sessionshelper??
  def current_user 
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in? 
    !!current_user
  end 
end
