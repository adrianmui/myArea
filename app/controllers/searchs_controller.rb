require 'factual'

class SearchsController < ApplicationController
  def index
  end
  def new
    @factual = Factual.new(Rails.application.secrets.OAUTH_KEY, Rails.application.secrets.OAUTH_SECRET)
     
    @user = current_user
    if params[:query_dist].to_i
      dist = params[:query_dist].to_i > 0 ? params[:query_dist] : 1
      name = params[:query_name] if params[:query_name]
      if @user.profile
        address = @user.profile.address
        if @user.profile.location
          longitude = @user.profile.location.longitude
          latitude = @user.profile.location.latitude
          @places_near_me = @factual.table("places-us").search("#{name}").geo("$circle" => {"$center" => [latitude, longitude], "$meters" => dist }).rows
        end
      end
    end
  end


end
