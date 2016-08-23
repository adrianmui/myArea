class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(whitelisted_location_params)
    if @location.save
      flash[:success] = "Location has been generated"
      redirect_to current_user
    else
      flash[:success] = "Location has NOT! been generated"
      render :new
    end

  end

  def show

  end


  private
  def whitelisted_location_params
      params.
        require(:location).
        permit( :address)
    end
end
