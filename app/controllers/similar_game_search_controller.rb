class SimilarGameSearchController < ApplicationController


  def create
      game = create_game_objects(params)
      create_redirect(game)
  end

  private 

  def create_game_objects(params)
    results = IScreamResults.new
    game_name = params[:similar].to_s
    game = results.create_game_objects(params[:similar])

  end

  def create_redirect(game)
    if game.is_a?(String)
      flash[:error] = game 
      redirect_back(fallback_location: '/')
    elsif game.is_a?(Integer)
      render file: '/public/404'
    else
      redirect_to "/game_search/#{game.id}"
    end
  end
end