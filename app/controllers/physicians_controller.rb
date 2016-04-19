class PhysiciansController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    profession = Profession.find_by(name: 'Physician')
    @physicians = profession.professionals
  end

  def show
    @physician = Professional.find(params[:id])
  end

  def new
    @physician = Professional.new
  end

  def create
    profession = Profession.find_by(name: 'Physician')
    @physician = profession.professionals.new(physician_params)
    if @physician.save
      redirect_to physicians_path
    else
      render :new
    end
  end

  def edit
    @physician = Professional.find(params[:id])
  end

  def update
    @physician = Professional.find(params[:id])
    if @physician.update(physician_params)
      redirect_to physician_path(@physician)
    else
      render :edit
    end
  end

  def destroy
    @physician = Professional.find_by id: params[:id]
    @physician.destroy
    redirect_to physicians_path
  end

  private

  def physician_params
    params
      .require(:professional)
      .permit(:first_name, :last_name, :address, :phone_number,
              :email, :bio, :image)
  end
end
