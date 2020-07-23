class UsersController < ApplicationController 

  def show
    @user = current_user if current_user 
    @user = backup_user  if !current_user
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    if missing_params.present?
      missing_params_error
    else
      update_profile_success
    end
  end

  private

  def update_params
    params.require(:user).permit(:email, :name, :photo)
  end

  def missing_params
    missing_params = []
    params[:user].each do |key, value|
      missing_params << key if value == ''
    end
    missing_params.join(', ')
  end

  def missing_params_error
    flash[:error] = "Please enter a #{missing_params}."
    redirect_to edit_user_path(@current_user)
  end

  def update_profile_success
    user = User.find(params[:id])
    user.update(update_params)
    if user.save
      flash[:notice] = "You have updated your profile"
      current_user.reload
    end
    redirect_to '/profile'
  end




  def backup_user 
    User.find_by(name: "George Washington")
  end 
  
end