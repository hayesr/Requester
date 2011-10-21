class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    @user = User.find(params[:id])
    @sites = Site.all
    @needs = Need.all
  end
  
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "User updated."
    else
      render :action => 'edit'
    end
  end
  
  def delete
    
  end
end