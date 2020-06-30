class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :verified_user, :user_is_authenticated, :current_user

  def verified_user
    redirect_to '/' unless user_is_authenticated
  end
  
  def user_is_authenticated
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end
