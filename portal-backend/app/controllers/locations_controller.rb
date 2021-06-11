class LocationsController < ApplicationController
    # before_action :authenticate_user!
   # before_action :set_myth
   def index
    @locations = Location.all 
end
    def show 
        @location = Location.find(params[:id])
    end 
    def new 
        @location = Location.new
    end 
    def edit 
        @location =  Location.find(params[:id])
    end 
    def create 
      #  @location = Location.find(params[:id])
        @location = Location.new(location_params)
        if @location.save 
            redirect_to location_path(@location), notice: "Location Successfully Created"
        else 
            render 'new'
        end 
    end 
    def destroy 
        @location = Location.find(params[:id]).destroy
        redirect_to locations_path(@locations)
    end 
    def update 
        @location = Location.find(params[:id])
        if @location.update(location_params)
            redirect_to location_path(@location), notice: "location Successfully Updated" 
        else 
            render :edit 
        end
    end

    private 
    def set_location
        @location = Location.find(params[:location_id])
    end 

    def location_params
        params.require(:location).permit(:name, :city)
    end 
end
