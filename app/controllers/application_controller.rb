class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private 
  def confirm_login
    unless session[:user_id]
    flash[:notice] = "Please Log In"
    redirect_to access_login_path
    end
  end
end
