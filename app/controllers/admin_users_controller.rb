class AdminUsersController < ApplicationController
  
  layout 'admin'
  
  
  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end
  
  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      redirect_to admin_users_path
    else
      render 'new'
    end
  end
  def update
  @admin_user =AdminUser.find(params[:id])
  if @admin_user.update(admin_user_params)
    redirect_to admin_user_path(@admin)
  else
    render 'edit'
  end
  end
  

  def edit
    @admin_user =AdminUser.find(params[:id])
  end

  def delete
    @admin_user =AdminUser.find(params[:id])
  end
  
  private
  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
  end
  
end
