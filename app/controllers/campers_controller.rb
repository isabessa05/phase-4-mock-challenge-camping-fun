class CampersController < ApplicationController

    def index
        camper = Camper.all
        render json: camper, status: :ok
    end

    def show 
        camper = Camper.find_by(id: params[:id])
        if camper 
            render json: camper, serializer: CamperWithActivitiesSerializer, status: :ok
        else
            render json: {error: "Camper not found"}, status: :not_found
        end
    end

    def create
        camper = Camper.create(name: params[:name], age: params[:age])
        if camper.valid?
            render json: camper, status: :created
        else
            render json: {errors: camper.errors.full_messages}, status: :unprocessable_entity
        end
    end



end
