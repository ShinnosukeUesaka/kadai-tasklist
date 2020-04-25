class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def check_user(user)
    unless user == current_user
      redirect_to login_path
    end
  end

  def require_user_logged_in
    unless logged_in?
      redirect_to login_path
    end
  end
end
