class ProfilesController < ApplicationController
  include ProfilesHelper

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(whitelisted_profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      flash[:success] = "User Profile was created"
      redirect_to current_user
    else
      flash[:error] = "User Profile NOT! created"
      render :new
    end
  end

  private
    def whitelisted_profile_params
      params.
        require(:profile).
        permit( :first_name,
                :last_name,
                :address,
                :city,
                :state,
                :zip)
    end
end
