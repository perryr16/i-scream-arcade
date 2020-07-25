class SessionsController < ApplicationController

  def create
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    flash[:notice] = "Logged in as #{@user.name}"
    redirect_to '/profile'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end