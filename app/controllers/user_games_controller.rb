class UserGamesController < ApplicationController 

  def create
    game = Game.find(params[:format])
    if UserGame.user_game_exists?(game.id, current_user.id)
      flash[:notice] = "You have already added #{game.title} to Your Games"
    elsif !current_user 
      flash[:notice] = "You must sign in to add games to Your Games"
    else #UserGame.find_by(game_id: param([:id]), user: current_user)
      user_game = UserGame.create(game_id: game.id, user_id: current_user.id)
      flash[:notice] = "You have added #{game.title} to Your Games"
    end 
    redirect_back(fallback_location: games_path)
  end

end