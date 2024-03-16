class ReviewsController < ApplicationController
  before_action :set_wedding

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.wedding = @wedding
    @review.user = current_user
    if @review.save!
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
