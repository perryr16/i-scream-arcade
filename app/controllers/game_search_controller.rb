class GameSearchController < ApplicationController
  def show
    results = IScreamResults.new
    if params[:search_type] == 'game'
      @game = results.create_game_objects(params[:search])
    elsif params[:similar]
      game_name = params[:similar].to_s
      @game = results.create_game_objects(params[:similar])
    end
  end

  def index
    @games = Game.all
    #this is just for getting the page up and running

    if params[:search_type] == "keyword"
      render :index
    else
      render :show
    end
  end
end