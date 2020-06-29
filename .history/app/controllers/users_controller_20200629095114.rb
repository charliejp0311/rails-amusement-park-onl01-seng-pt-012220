class UsersController < ApplicationController
  def new
  end
  def create
    @user = User.new(user_params)
    if@user.save
      render user_path(@user)
    else 
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :tickets, :happiness, :nausea, :password, :password_confirmation)
  end
end
