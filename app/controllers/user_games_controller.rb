class UserGamesController < ApplicationController 

  def create
    game = Game.find(params[:format])
    if !current_user 
      flash[:notice] = "You must sign in to add games to Saved Games"
    elsif UserGame.user_game_exists?(game.id, current_user.id)
      flash[:notice] = "You have already added #{game.name} to Saved Games"
    else #UserGame.find_by(game_id: param([:id]), user: current_user)
      user_game = UserGame.create(game_id: game.id, user_id: current_user.id)
      flash[:notice] = "You have added #{game.name} to Saved Games"
    end 
    redirect_back(fallback_location: games_path)
  end

  def destroy 
    game = Game.find(params[:id])
    user_game = UserGame.find_by(user_id: current_user.id, game_id: game.id)
    UserGame.destroy(user_game.id)
    flash[:notice] = "You have removed #{game.name} from Saved Games"
    redirect_back(fallback_location: '/profile')
  end

end