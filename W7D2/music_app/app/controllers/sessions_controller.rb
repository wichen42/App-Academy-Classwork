class SessionsController < ApplicationController

    def create # login user.
        user = User.find_by_credentials(params[:user][:email],params[:user][:password])
        if user
            #login!(user)
            redirect_to user_url(user.id)
        else
            render :new
        end
    end

    def new # login page
        render :new
    end

end