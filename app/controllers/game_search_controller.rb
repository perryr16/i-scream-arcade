class GameSearchController < ApplicationController
  def show
    # binding.pry
  end

  def index
    # binding.pry
    if params[:search_type] == "keyword"
      render :index
    else
      render :show
    end
  end
end