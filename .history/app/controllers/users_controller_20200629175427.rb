class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def show
    @user = set_user
    if !current_user.admin 
      if current_user != @user
        redirect_to root_path
      end
    else
      render admin_user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :tickets, :happiness, :nausea, :password, :admin)
  end
  def set_user
    User.find_by(id: params[:id])
  end
end
