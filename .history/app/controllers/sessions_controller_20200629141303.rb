class SessionsController < ApplicationController
    def new
              
    end

    def create
        # if !!params[:user][:name] && !params[:user][:name].empty?
        if session.include?(:user_id)
            redirect_to '/'
        else
            @user = User.find_by(name: params[:user][:name])
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
        # else
        #     redirect_to 
        # end
    end
    def destroy
        
    end
    
    
end