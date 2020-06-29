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
    if session.include?(:user_id)
      redirect_to '/'
    else
      @user = set_user
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :tickets, :happiness, :nausea, :password)
  end
  def set_user
    User.find_by(id: params[:id])
  end
end
