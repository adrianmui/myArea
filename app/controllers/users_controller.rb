class UsersController < ApplicationController

  def show
  end

  def create
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
