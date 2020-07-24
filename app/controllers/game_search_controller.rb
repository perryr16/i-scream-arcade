class GameSearchController < ApplicationController
  def show
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