class ReviewsController < ApplicationController
  before_action :find_attorney
  before_action :find_physician
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.physician_id = @physician.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to physician_path(@physician)
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @review.update(review_params)
      redirect_to physician_path(@physician)
    else
      render :edit

    end
  end

  def destroy
    @review.destroy
    redirect_to physician_path(@physician)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_physician
    @physician = Physician.find(params[:physician_id])
  end

  def find_attorney
    @attorney = Attorney.find(params[:attorney_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
