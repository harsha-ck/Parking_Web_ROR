class SpotsController < ApplicationController
 before_action :restrict_access

   def index
     @spots = Spot.paginate(page: params[:page], per_page: 5)
      begin
        custs = Customer.where(exit: nil)
        if custs.present?
          custs.each do |customer|
            entry = customer.entry
            if (Time.now - entry) >= 48.hours
              CustomerMailer.duration_exceeded(customer).deliver_now
            end
          end
        end
      rescue => e
        puts "An error occurred: #{e}"
      end

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

     redirect_to spots_path, status: :see_other
    end
   private

   def spots_params
     params.require(:spot).permit(:spots, :vtype)
   end

 end

