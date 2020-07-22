class FavoritesController < ApplicationController

  def update
    game = Game.find(params[:id])
    favorite = Favorite.new(session[:favorite])
    if session[:favorite].nil? || session[:favorite][game.id.to_s].nil?
      favorite.add_game(game.id)
      session[:favorite] = favorite.contents
      flash[:notice] = "You have added #{game.title} to your favorites"
    end
    redirect_back(fallback_location: "/games")
  end
  
end