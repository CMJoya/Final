class ProfessionalsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit]

  def index
    @professionals = Professional.all.order(average_rating: :DESC)
  end

  def show
    @professional = Professional.find(params[:id])
  end

  def edit
    @professional = Professional.find(params[:id])
  end

  def update
    @professional = Professional.find(params[:id])
    if @professional.update(professional_params)
      redirect_to professional_path(@professional)
    else
      render :edit
    end
  end

  def destroy
    @professional = Professional.find_by id: params[:id]
    @professional.destroy
    redirect_to root_path
  end

  private

  private

  def professional_params
    params
      .require(:professional)
      .permit(:first_name, :last_name, :address, :phone_number,
              :email, :bio, :image, :placeId)
  end
end
