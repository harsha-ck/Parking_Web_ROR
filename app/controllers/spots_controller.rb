class SpotsController < ApplicationController
 before_action :restrict_access

   def index
     @spots = Spot.all

   end

   def show
     @spots = Spot.find(params[:id])

   end

   def new
     @spot = Spot.new
   end

   def create
     @spot = Spot.new(spots_params)
     @spot.status = false
     if @spot.save
       redirect_to @spot, notice: 'Park was successfully created.'
     else
       render :new, status: :unprocessable_entity
     end
   end
   def edit
     @spot = Spot.find(params[:id])
   end
  def update
     @spot = Spot.find(params[:id])
      if @spot.update(spots_params)
        redirect_to @spot, notice: 'Park was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
     @spot = Spot.find(params[:id])
     @spot.destroy

     redirect_to root_path, status: :see_other
    end
   private

   def spots_params
     params.require(:spot).permit(:spots, :vtype)
   end

 end

