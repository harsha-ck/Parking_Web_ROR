# frozen_string_literal: true

module Api
  module V1
    class CustomerController < ApplicationController
      skip_before_action :require_login
      skip_before_action :verify_authenticity_token

      # POST for check in /api/v1/customer
      def create
        @spot = Spot.find_by(spots: customer_params[:spots], vtype: customer_params[:vtype], status: false)

        return render json: { error: 'Spot taken or does not exist' }, status: :not_found unless @spot

        customer_vnum = Customer.find_by(vnum: customer_params[:vnum], exit: nil)
        @customer = Customer.new(customer_params)
        if !customer_vnum.nil?
          render json: { error: 'Vehicle already parked' }, status: 409
        else
          @customer.entry = Time.now
          @customer.exit = nil
          @customer.price = nil
          @customer.spot_id = @spot.id

          if @customer.save
            @spot.update(status: true)
            render json: @customer, status: 201

          else
            render json: { error: 'Unable to check in.', errors: @customer.errors }, status: 400
          end
        end
      end

      def check

            @customer = Customer.find_by(vnum: params[:vnum], exit: nil)
            # Customer.joins(:Spot).where("vnum = ? and Spots.status = ?", params[:vnum], true).first
            if @customer.present?

              entry_time = @customer.entry
              @exit_time = Time.now
              @duration = @exit_time - entry_time
              @price = if @customer.vtype == '2'
                         if @duration <= 2.hours
                           30
                         else
                           30 + 20 * ((@duration - 2.hours) / 1.hours).ceil
                         end
                       elsif @duration <= 2.hours
                         50
                       else
                         50 + 20 * ((@duration - 2.hours) / 1.hours).ceil
                       end
              @customer.update(exit: @exit_time, price: @price)
              @spot = Spot.find_by(id: @customer.spot_id)
              @spot.update(status: false)
              render json: @customer, status: 200

            else
              render json: { error: 'Invalid vehicle number or vehicle not Spotted.' }, status: :not_found
            end

        end

      private

      def customer_params
        params.require(:customer).permit(:vnum, :email, :spots, :vtype)
      end
    end
  end
end
