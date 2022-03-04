class SessionsController < ApplicationController
    before_action :login_restriction, only: [:create, :new]

    def new
        
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user and user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "successfully logged in"
            redirect_to root_path
        else
           flash.now[:error] = "wrong info" 
           render :new
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "successly logged out"
        redirect_to login_path
    end

    private

    def login_restriction
        if logged_in?
            flash[:error] = "you are already logged in "
            redirect_to root_path
        end
    end

    
end
