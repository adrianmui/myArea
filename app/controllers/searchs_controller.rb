class SearchsController < ApplicationController
  def index
  end
  def new
    @factual = Factual.new(Rails.application.secrets.OAUTH_KEY, Rails.application.secrets.OAUTH_SECRET)
     
    @user = current_user
    if dist = params[:query_dist].to_i
      if @user.profile
        address = @user.profile.address
        if @user.profile.location
          longitude = @user.profile.location.longitude
          latitude = @user.profile.location.latitude
          @places_near_me = @factual.table("places-us").geo("$circle" => {"$center" => [latitude, longitude], "$meters" => dist }).rows
        end
      end
    end
  end


end
