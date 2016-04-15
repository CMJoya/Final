class PhysiciansController < ApplicationController
    before_action :find_physican, only: [:show, :edit, :update, :delete]
    before_action :authenticate_user!, only: [:new, :edit]

    def index
        if params[:category].blank?
            @physicians = Physician.all.order('created_at DESC')
        else
            @category_id = Category.find_by(name: params[:category]).id
            @physicians = Physician.where(category_id: @category_id).order('created_at DESC')
        end
    end

    def new
        @physician = current_user.physicians.build
        @categories = Category.all.map { |c| [c.name, c.id] }
    end

    def show
        if @physician.reviews.blank?
            @average_review = 0
        else
            @average_review = @physician.reviews.average(:rating).round(2)
        end
    end

    def create
        @physician = current_user.physicians.build(physician_params)
        @physician.category_id = params[:category_id]

        if @physician.save
            redirect_to physicians_path
        else
            render :new
        end
    end

    def edit
        @categories = Category.all.map { |c| [c.name, c.id] }
    end

    def update
        @physician.category_id = params[:category_id]
        if @physician.update(physician_params)
            redirect_to physician_path(@physician)
        else
            render :edit
        end
    end

    def destroy
        @physician = Physician.find_by id: params[:id]
        @physician.destroy
        redirect_to physicians_path
    end

    private

    def physician_params
        params.require(:physician).permit(:first_name, :last_name, :address, :phone_number, :email, :bio, :category_id, :physician_img)
    end

    def find_physican
        @physician = Physician.find_by id: params[:id]
    end
end
