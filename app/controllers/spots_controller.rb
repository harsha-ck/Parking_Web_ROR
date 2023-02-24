# frozen_string_literal: true

class SpotsController < ApplicationController
  #  before_action :restrict_access
  before_action :set_spot, only: %i[show edit update destroy]
  def index
    @spots = Spot.paginate(page: params[:page], per_page: 5)
    authorize @spots
  end

  def show
    authorize @spot
  end

  def new
    @spot = Spot.new
    authorize @spot
  end

  def create
    @spot = Spot.new(spots_params)
    authorize @spot
    @spot.status = false
    if @spot.save
      redirect_to @spot, notice: " Spot: #{@spot.spots} created successfully ."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @spot
  end

  def update
    authorize @spot
    if @spot.update(spots_params)
      redirect_to @spot, notice: " Spot: #{@spot.spots} was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @spot
    @spot.destroy

    redirect_to spots_path, status: :see_other, notice: "Spot: #{@spot.spots} was successfully deleted."
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

  private

  def spots_params
    params.require(:spot).permit(:spots, :vtype)
  end
end
