class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    raise
    
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

    def whitelisted_user_params
      params.
        require(:user).
        permit( :username,
                :email,
                :password,
                :password_confirmation)
    end

    def static_map_for(location, options = {})
    params = {
      :center => [location.lat, location.lng].join(","),
      :zoom => 15,
      :size => "300x300",
      :markers => [location.lat, location.lng].join(","),
      :sensor => true
      }.merge(options)

    query_string =  params.map{|k,v| "#{k}=#{v}"}.join("&")
    image_tag "http://maps.googleapis.com/maps/api/staticmap?#{query_string}", :alt => location.name
    end
end
