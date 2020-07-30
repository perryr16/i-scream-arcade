class GameSearchController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.find(session[:search_ids])
  end

  def create
    if !params[:search_type]
      flash[:error] = "Please Select a Search Type"
      redirect_to "/"
    elsif params[:search] == ""
      flash[:error] = "Please Enter a Valid Search"
      redirect_to "/"
    else
      game = create_game_objects(params)
      create_redirect(game)
    end
  end

  private 

  def create_game_objects(params)
    results = IScreamResults.new
    if params[:search_type] == 'game'
      game = results.create_game_objects(params[:search])
    elsif params[:search_type] == 'keyword'
      games = results.games_by_keywords(params[:search])
      return games if games.is_a?(String)
      session[:search_ids] = games.map(&:id) if games.is_a?(Array)
    end

  end

  def create_redirect(game)
    if game.is_a?(String)
      flash[:error] = game 
      redirect_back(fallback_location: '/')
    elsif params[:search_type] == 'keyword'
      redirect_to "/game_search"
    else
      redirect_to "/game_search/#{game.id}"
    end
  end
end