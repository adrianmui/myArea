class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
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
end
