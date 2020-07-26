class ReviewsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
  end

  def create
    game = Game.find(params[:game_id])
    game.reviews.create(review_params)
    redirect_to "/games/#{game.id}"
  end

  private

  def review_params
    params.permit(:title, :user_rating, :content)
  end
end
