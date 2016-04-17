class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @professional = Professional.find(params[:id])
    @review = @professional.reviews.new
  end

  def create
    @review = Review.new(review_params)
    professional = @review.professional
    @review.user_id = current_user.id
    if @review.save
      avg_rating = professional.reviews.average(:rating).round(2)
      professional.average_rating = avg_rating
      professional.save
      redirect_to professional_path(@review.professional.id)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to professional_path(@review.professional.id)
    else
      render :edit

    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to professional_path(@review.professional.id)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :professional_id)
  end
end
