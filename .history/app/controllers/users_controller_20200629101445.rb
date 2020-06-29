class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.find_or_create_by(user_params)
    if@user
      session[:user_id] = @user.id
      render user_path(@user)
    else 
      redirect_to new_user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :tickets, :happiness, :nausea, :password, :password_confirmation)
  end
end
