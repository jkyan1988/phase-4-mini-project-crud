class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices
    end

    def show
        spices = Spice.find_by(id: params[:id])
        render json: spices
    end

    def create
        spices = Spice.create(spice_params)
        render json: spices, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
          spice.update(spice_params)
          render json: spice
        else
          render json: { error: "spice not found" }, status: :not_found
        end
    end

    def destroy
        spices = Spice.find_by(id: params[:id])
        if spices
            spices.destroy
            head :no_content
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end


    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
