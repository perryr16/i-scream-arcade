class GameSearchController < ApplicationController
  def show
  end

  def index
    if params[:search_type] == "keyword"
      render :index
    else
      render :show
    end
  end
end