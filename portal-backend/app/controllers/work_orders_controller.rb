class WorkOrdersController < ApplicationController
    #   before_action :authenticate_user!
    # before_action :set_location
   def index
    @work_orders = WorkOrder.all 
end
    def show 
        @work_order = WorkOrder.find(params[:id])
    end 
    def new 
        @work_order = WorkOrder.new
    end 
    def edit 
        @work_order =  WorkOrder.find(params[:id])
    end 
    def create 
      #  @location = WorkOrder.find(params[:id])
        @work_order = WorkOrder.new(work_order_params)
        if @work_order.save 
            redirect_to work_order_path(@work_order), notice: "WorkOrder Successfully Created"
        else 
            render 'new'
        end 

    end 
    def destroy 
        @work_order = WorkOrder.find(params[:id]).destroy
        redirect_to work_orders_path(@work_orders)
    end 
    def update 
        @work_order = WorkOrder.find(params[:id])
        if @work_order.update(work_order_params)
            redirect_to work_orders_path(@work_order), notice: "WorkOrder Successfully Updated" 
        else 
            render :edit 
        end
    end

    private 
    def set_location
        @location = Location.find(params[:location_id])
    end 

    def work_order_params
        params.require(:work_order).permit(:time, :duration, :price, :user_id, :location_id, location_attributes: [:name])
    end 
end
