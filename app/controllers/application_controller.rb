class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    # switched to cookies-based from session-based
    # regenerate the token as well
    def sign_in(user)
      user.regenerate_auth_token
      cookies[:auth_token] = user.auth_token
      @current_user = user
    end

    # new wrinkle for permanent sign-in
    # uses `cookies.permanent` instead of just `cookies`
    def permanent_sign_in(user)
      user.regenerate_auth_token
      cookies.permanent[:auth_token] = user.auth_token
      @current_user = user
    end

    def require_login
      unless signed_in_user?
        flash[:alert] = "Not authorized, please sign in!"
        redirect_to login_path
      end
    end

    # cookies!
    def sign_out
      @current_user = nil
      cookies.delete(:auth_token)
    end

    # cookies!
    def current_user
      @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
    end
    helper_method :current_user

    def signed_in_user?
      !!current_user
    end
    helper_method :signed_in_user?

    def add_key
      "&key=AIzaSyD1_SmqYgQyPXcNPlTaEP-dt5kd59_YNU4"
    end
    helper_method :add_key

    # def signed_in_user_has_profile?
    #   !@current_user.profile.nil?
    # end

    # helper_method :signed_in_user_has_profile?
end
