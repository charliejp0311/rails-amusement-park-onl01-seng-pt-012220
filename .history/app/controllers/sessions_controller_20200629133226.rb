class SessionsController < ApplicationController
    def new
              
    end

    def create
        # if !!params[:user][:name] && !params[:user][:name].empty?
            @user = User.find_by(name: params[:user][:name])
            if !!params[:password]
                return head(:forbidden) unless @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                redirect_to user_path(@user)
            end
        # else
        #     redirect_to 
        # end
    end
    def destroy
        
    end
    
    
end