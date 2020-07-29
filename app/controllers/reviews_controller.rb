class ReviewsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    review = @game.reviews.create(review_params)
    if review.save
      flash[:notice] = "Your Review Has Been Added"
      redirect_to "/games/#{@game.id}"
    else
      flash[:error] = review.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def review_params
    params.permit(:title, :user_rating, :content)
  end
end
