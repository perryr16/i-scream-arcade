class GameSearchController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.find(session[:search_ids])
  end

  def create
    if !params[:search_type] && !params[:similar]
      flash[:error] = "Please Select a Search Type"
      redirect_to "/"
    elsif params[:search] == ""
      flash[:error] = "Please Enter a Valid Search"
      redirect_to "/"
    elsif empty_quiz 
      flash[:error] = "Please Tell Me a Fear"
      redirect_to "/quiz"
    else
      game = create_game_objects(params)
      create_redirect(game)
    end
  end

  private 

  def empty_quiz
    if params[:search_type] == 'quiz'
      boxes = params.keys.find_all {|param| param.include?("box")}
      boxes.empty?
    end
  end

  def create_game_objects(params)
    results = IScreamResults.new
    if params[:search_type] == 'game'
      game = results.create_game_objects(params[:search])
    elsif params[:similar]
      game_name = params[:similar].to_s
      game = results.create_game_objects(params[:similar])
    elsif params[:search_type] == 'keyword'
      games = results.games_by_keywords(params[:search])
      return games if games.is_a?(String)
      session[:search_ids] = games.map(&:id) if games.is_a?(Array)
    elsif params[:search_type] == 'quiz'
      boxes = params.keys.find_all {|param| param.include?("box")}
      fear_keywords = params.permit(boxes).to_h.values.join(',')
      
      games = results.games_by_keywords(fear_keywords)
      session[:search_ids] = games.map(&:id) if games.is_a?(Array)
    end

  end

  def create_redirect(game)
    if game.is_a?(String)
      flash[:error] = game 
      redirect_back(fallback_location: '/')
    elsif params[:search_type] == 'keyword'
      redirect_to "/game_search"
    elsif params[:search_type] == 'quiz'
      redirect_to "/game_search"
    else
      redirect_to "/game_search/#{game.id}"
    end
  end
end