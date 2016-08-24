require 'factual'

class LocationsController < ApplicationController


  def index
    @factual = Factual.new(Rails.application.secrets.OAUTH_KEY, Rails.application.secrets.OAUTH_SECRET)
    @user = current_user
    if @user.profile
      address = @user.profile.address
      if @user.profile.location
        longitude = @user.profile.location.longitude
        latitude = @user.profile.location.latitude
        @places_near_me = @factual.table("places-us").geo("$circle" => {"$center" => [latitude, longitude], "$meters" => 500}).rows
      end
    end
  end

  def new
    @location = Location.new
  end

  def create
    @locationable = get_locationable_resource
    

    if @locationable.nil?
      @location = current_user.profile.location = Location.new(
        whitelisted_location_params)
    elsif @locationable.class == User
      @location = @locationable.locations.build(whitelisted_location_params)
    else
      @location = current_user.profile.location
    end

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

  def get_locationable_resource
    resource = User.find(params[:user_id]) if params[:user_id]
    resource = Profile.find(params[:profile_id]) if params[:profile_id]
    resource
  end

  def whitelisted_location_params
      params.
        require(:location).
        permit( :address)
    end
end
