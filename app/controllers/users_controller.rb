require 'factual'

class UsersController < ApplicationController
  include ApplicationHelper

  #skip_before_action :verify_authenticity_token

  def show
    @user = User.find(params[:id])
    if @user.profile
      address = @user.profile.address
      if @user.profile.location
        longitude = @user.profile.location.longitude
        latitude = @user.profile.location.latitude

        
        @loc = static_map_for(latitude, longitude, address)
        @loc = @loc + add_markers_map(@user) + add_key

      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      sign_in(@user)
      #User.delay(queue: "email", priority: 28, run_at: 5.seconds.from_now).send_welcome_email(@user.id)
      flash[:success] = "User was created"
      redirect_to @user
    else
      flash[:error] = "User was NOT! created"
      render :new
    end
  end

  def edit
  end

  def delete
  end

  def update
  end

  private

    def add_markers_map(user)
      str = ""
      user.locations.each do |loc|
        str += "&markers=color:green\%7Clabel:C\%7C#{loc.latitude},#{loc.longitude}"
      end
      str
    end

    def add_key
      "&key=AIzaSyD1_SmqYgQyPXcNPlTaEP-dt5kd59_YNU4"
    end

    def whitelisted_user_params
      params.
        require(:user).
        permit( :username,
                :email,
                :password,
                :password_confirmation)
    end

    
end
