class SessionsController < ApplicationController
    def new
        if !!session[:user_id] && !session[:user_id].empty?
            @user = User.find_by(id: session[:user_id])
        else
            @user = User.new
        end                
    end

    def create
        if !!params[:user][:name] && !params[:user][:name].empty? 
            @user = User.find_by(name: params[:user][:name])
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to '/signin'
        end
    end
    def destroy
        
    end
    
    
end