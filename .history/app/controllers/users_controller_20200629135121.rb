class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end
  def show
    logged_in
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :tickets, :happiness, :nausea, :password)
  end
  def set_user
    User.find_by(id: params[:id])
  end
  def logged_in
    if !!session[:user_id] && !session[:user_id].empty?
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to '/'
    end
  end
end
