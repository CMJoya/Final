class AttorneysController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    profession = Profession.find_by(name: 'Attorney')
    @attorneys = profession.professionals.order(active_rating: :desc)
  end

  def show
    @attorney = Professional.find(params[:id])
  end

  def new
    @attorney = Professional.new
  end

  def create
    @attorney = Professional.new(attorney_params)
    @attorney.profession = Profession.find_by(name: 'Attorney')
    if @attorney.save
      redirect_to attorneys_path
    else
      render :new
    end
  end

  def edit
    @attorney = Professional.find(params[:id])
  end

  def update
    @attorney = Professional.find(params[:id])
    if @attorney.update(attorney_params)
      redirect_to attorney_path(@attorney)
    else
      render :edit
    end
  end

  def destroy
    @attorney = Professional.find_by id: params[:id]
    @attorney.destroy
    redirect_to attorneys_path
  end

  private

  def attorney_params
    params
      .require(:professional)
      .permit(:first_name, :last_name, :address,
             :email, :phone_number, :bio, :image)
  end
end
