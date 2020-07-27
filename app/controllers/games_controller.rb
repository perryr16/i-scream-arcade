class GamesController < ApplicationController
  def show
    @game = Game.find(params[:game_id])
    # binding.pry
  end

  def index 
    @games = Game.all
  end
  
end