class SessionsController < ApplicationController

  def new
  end
  
  def create
    response = request.env['omniauth.auth']
    user = User.from_omniauth(response)
    session[:user_id] = user.id
    flash[:notice] = "Logged in as #{user.name}"
    log_in(user)
  end

end