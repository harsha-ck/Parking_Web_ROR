# frozen_string_literal: true

module Api
  module V1
    class SpotsController < ApplicationController
      skip_before_action :require_login
      skip_before_action :verify_authenticity_token

      # GET spots /api/v1/spots
      def index
        @spots = Spot.all
        render json: @spots
      end

      # GET show with id Spot /api/v1/spots/:id
      def show
        @spot = Spot.find(params[:id])
        render json: @spot
      end
      #  POST create spot /api/v1/spots

      def create
        @spot = Spot.new(spots_params)
        @spot.status = false
        if @spot.save
          render json: @spot, status: 201
        else
          render json: { error: 'Unable to create spot.', errors: @spot.errors }, status: 400
        end
      end
      # PUT for update  /api/v1/spots/:id

      def update
        @spot = Spot.find(params[:id])
        if @spot.update(spots_params)
          render json: @spot, status: 200
        else
          render json: { error: 'Unable to update spot.', errors: @spot.errors }, status: 400
        end
      end

      # DELETE spot /api/v1/spots/:id

      def destroy
        @spot = Spot.find_by(id: params[:id])

        if @spot.present? && @spot.status == false
          if @spot.destroy
            render json: { message: 'Spot deleted successfully.' }, status: 200
          else
            render json: { error: 'Unable to delete spot.' }, status: 400
          end
        else
          render json: { error: 'Spot does not exist or Spot in use.' }, status: 404
        end
      end

      def spots_params
        params.require(:spot).permit(:spots, :vtype)
      end
    end
  end
end
