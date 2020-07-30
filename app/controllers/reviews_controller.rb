class ReviewsController < ApplicationController

  def new
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    # current_user.reviews.build
    review = current_user.reviews.create(review_params)
    if review.save
      flash[:notice] = "Your Review Has Been Added"
      redirect_to "/games/#{@game.id}"
    else
      flash[:error] = review.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:review_id])
    if @review.update(review_params)
      flash[:notice] = "You have successfully updated your review"
      redirect_to "/games/#{@game.id}"
    else
      redirect_to "/games/#{@review.game_id}/#{@review.id}/edit"
      flash[:notice] = "Updates haven't been made. Fill in all blanks"
    end
  end

  private
  def review_params
    params.permit(:title, :user_rating, :content, :user_id, :game_id)
  end
end
