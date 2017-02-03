class AccessController < ApplicationController
  layout 'admin'

  #before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  # doesn't run before the "except" actions
   before_action :confirm_login, :except => [:login, :attempt_login, :logout]
   
  def menu
    # display text & links
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        found_user.authenticate(params[:password_digest])
        authorized_user = found_user
      end
    end
      if authorized_user
        session[:user_id] = authorized_user.id 
        flash[:notice] = "You Are logged In"
        redirect_to admin_path
      else
        flash.now[:notice] = "Invalid Username or password"
        render 'login'
      end
    end
  

  def logout
    # mark user as logged out
    session[:user_id] = nil
    flash[:notice]= "You Are logged out"
    redirect_to access_login_path
  end
  
  private
  def admin_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
  end
  
end  


