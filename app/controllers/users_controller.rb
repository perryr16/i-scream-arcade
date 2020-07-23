class UsersController < ApplicationController 

  def show
    @user = current_user if current_user 
    @user = backup_user  if !current_user
  end

  private

  def backup_user 
    User.find_by(name: "George Washington")
  end 
  
end