class UsersController < ApplicationController
  def new
  end
  def create
    @user = User.new(user_params)
    byebug
    if@user.save
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
