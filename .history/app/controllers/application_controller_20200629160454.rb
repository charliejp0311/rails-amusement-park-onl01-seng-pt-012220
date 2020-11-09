class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :verified_user, :logged_in?, :current_user

  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
      !!current_user
    end

    def verified_user
      redirect_to '/' unless user_is_authenticated
    end

  

end
