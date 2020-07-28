class GameSearchController < ApplicationController
  def show
    @game = Game.find(params[:id])
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
    elsif params[:similar]
      game_name = params[:similar].to_s
      game = results.create_game_objects(params[:similar])
    end

  end

  def missing_search(parmas)
    if !params[:search_type]
      flash[:error] = "Please Select a Search Type"
    elsif !params[:search]
      flash[:error] = "Please Enter a Valid Search"
    end
    redirect_to "/"
  end

  def create_redirect(game)
    if game == "Invalid Game Name"
      flash[:error] = game
      redirect_to "/"
    else 
      redirect_to "/game_search/#{game.id}"
    end
  end
end