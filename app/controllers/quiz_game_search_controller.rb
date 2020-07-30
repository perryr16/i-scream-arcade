class QuizGameSearchController < ApplicationController

  def create
    if empty_quiz 
      flash[:error] = "Please Tell Me a Fear"
      redirect_to "/quiz"
    else
      games = create_game_objects(params)
      create_redirect(games)
    end
  end

  private 

  def empty_quiz
      boxes = params.keys.find_all {|param| param.include?("box")}
      boxes.empty?
  end

  def create_game_objects(params)
    results = IScreamResults.new

    boxes = params.keys.find_all {|param| param.include?("box")}
    fear_keywords = params.permit(boxes).to_h.values.join(',')
      
    games = results.games_by_keywords(fear_keywords)
    session[:search_ids] = games.map(&:id) if games.is_a?(Array)
  end

  def create_redirect(game)
    if game.is_a?(String)
      flash[:error] = game 
      redirect_back(fallback_location: '/')
    else
      redirect_to "/game_search"
    end
  end
end