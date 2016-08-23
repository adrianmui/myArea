class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(whitelisted_location_params)
    @location.profile_id = current_user.profile.id
    if @location.save
      flash[:success] = "Location has been generated"
      redirect_to current_user
    else
      flash[:success] = "Location has NOT! been generated"
      render :new
    end

  end

  def show
    @location = Location.find(params[:id])
  end


  private
  def whitelisted_location_params
      params.
        require(:location).
        permit( :address)
    end
end
