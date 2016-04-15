class AttorneysController < ApplicationController
    before_action :find_attorney, only: [:show, :edit, :update, :delete]
    before_action :authenticate_user!, only: [:new, :edit]

    def index
        if params[:category].blank?
            @attorneys = Attorney.all.order('created_at DESC')
        else
            @category_id = Category.find_by(name: params[:category]).id
            @attorney = Attorney.where(category_id: @category_id).order('created_at DESC')
        end
    end

    def new
        @attorney = current_user.attorneys.build
        @categories = Category.all.map { |c| [c.name, c.id] }
    end

    def show
        if @attorney.reviews.blank?
            @average_review = 0
        else
            @average_review = @attorney.reviews.average(:rating).round(2)
        end
    end

    def create
        @attorney = current_user.attorneys.build(attorney_params)
        @attorney.category_id = params[:category_id]

        if @attorney.save
            redirect_to attorneys_path
        else
            render :new
        end
    end

    def edit
        @categories = Category.all.map { |c| [c.name, c.id] }
    end

    def update
        @attorney.category_id = params[:category_id]
        if @attorney.update(attorney_params)
            redirect_to attorney_path(@attorney)
        else
            render :edit
        end
    end

    def destroy
        @attorney = Attorney.find_by id: params[:id]
        @attorney.destroy
        redirect_to attorneys_path
    end

    private

    def attorney_params
        params.require(:attorney).permit(:first_name, :last_name, :address, :email, :phone_number, :bio, :category_id, :attorney_img)
    end

    def find_attorney
        @attorney = Attorney.find_by id: params[:id]
    end
end
