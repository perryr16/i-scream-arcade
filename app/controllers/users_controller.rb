class UsersController < ApplicationController 

  def show
    @user = current_user if current_user 
    @user = backup_user  if !current_user
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 

  end

  private

  def backup_user 
    User.find_by(name: "George Washington")
  end 
  
end