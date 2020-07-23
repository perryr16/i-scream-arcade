class GameSearchController < ApplicationController
  def show
  end

  def index
    @games = Game.all
    if params[:search_type] == "keyword"
      render :index
    else
      render :show
    end
  end
end