class CustomerController < ApplicationController
  before_action :restrict_access, except: [:new, :create, :show, :checkout]
       def index
          @free_two = Spot.where(vtype: 2, status: false).count
          @allo_two = Spot.where(vtype: 2, status: true).count
          @free_four = Spot.where(vtype: 4, status: false).count
          @allo_four = Spot.where(vtype: 4, status: true).count
          @customers = Customer.where(exit: nil).paginate(page: params[:page], per_page: 5)


end



       def details
          @customersall = Customer.paginate(page: params[:page], per_page: 5)
       end
       def show
          @customers = Customer.find(params[:id])
       end
       def checkout
       if params[:vnum].present?
         @customer = Customer.find_by(vnum: params[:vnum], exit: nil)
              # Customer.joins(:Spot).where("vnum = ? and Spots.status = ?", params[:vnum], true).first
         if @customer.present?

           entry_time = @customer.entry
           @exit_time = Time.now
           @duration = @exit_time-entry_time
           if @customer.vtype == "2"
             @price = if @duration <= 2.hours
               30
             else
               30 + 20* ((@duration - 2.hours)/1.hours).ceil
             end
           else
              @price = if @duration <= 2.hours
              50
              else
              50 + 20* ((@duration - 2.hours)/1.hours).ceil
              end
           end
           @customer.update(exit: @exit_time, price: @price)
           @spot = Spot.find_by(id: @customer.spot_id)
           @spot.update(status: false)
           redirect_to customer_path(@customer), notice: "Customer was successfully checked out."
           begin
              CustomerMailer.invoice(@customer).deliver_now
            rescue => e
              flash[:error] = "Email not sent to '#{@customer.email}'"
              puts "An error occurred: #{e}"
            end
         else
           flash[:error] = "* Invalid vehicle number or vehicle not Spoted"
           render :checkout, status: :unprocessable_entity
         end
         else
          render :checkout
         end
       end

        def new
           @two, @four = Spot.where(status: false).partition{|spot| spot.vtype == 2}
           @customer = Customer.new
           @free_two = Spot.where(vtype: 2, status: false).count
           @allo_two = Spot.where(vtype: 2, status: true).count
           @free_four = Spot.where(vtype: 4, status: false).count
           @allo_four = Spot.where(vtype: 4, status: true).count
         end
    def create
       @free_two = Spot.where(vtype: 2, status: false).count
       @allo_two = Spot.where(vtype: 2, status: true).count
       @free_four = Spot.where(vtype: 4, status: false).count
       @allo_four = Spot.where(vtype: 4, status: true).count
       @two, @four = Spot.where(status: false).partition{|spot| spot.vtype == 2}
       spot = Spot.find_by(id: customer_params[:spot_id])

       customer_vnum = Customer.find_by(vnum: customer_params[:vnum], exit: nil)
       @customer = Customer.new(customer_params)
       if !customer_vnum.nil?
         @customer.errors.add(:base, "Vehicle already Spoted")
         render :new, status: :unprocessable_entity
       else

         if spot.nil?
            @customer.errors.add(:base, "Select Spot")
            render :new, status: :unprocessable_entity
         else
           @customer = Customer.new(customer_params)
           @customer.entry =  Time.now
           @customer.exit = nil
           @customer.price = nil
           @customer.spots = spot.spots
           @customer.vtype = spot.vtype

           if @customer.save
             spot.update(status: true)
             flash[:notice] = 'Checked in successfully.'
             redirect_to new_customer_path

           else
             render :new, status: :unprocessable_entity, notice: 'unsuccessful'
           end
         end
       end
    end

  def report

    session[:start_date] = params[:start_date]
    session[:end_date] = params[:end_date]
    session[:vtype] = params[:vtype]

    start_date = session[:start_date] || 7.days.ago
    end_date = session[:end_date] || Date.today
    vtype = session[:vtype] || "All"

    if start_date == "" || end_date == ""
        flash[:error] = "* Please select both Start and End date"
        start_date = 7.days.ago
        end_date = Date.today
    else
      start_date = Date.parse(session[:start_date]) if session[:start_date]
      end_date = Date.parse(session[:end_date]) if session[:end_date]
    end

    @vehicles = Customer.where(created_at: start_date.beginning_of_day..end_date.end_of_day)
    @vehicles = @vehicles.where(vtype: vtype) unless vtype == "All"
    @amount = @vehicles.sum(:price)

  end


     private

      def customer_params
        params.require(:customer).permit(:vnum,:email, :spot_id)
      end

  end