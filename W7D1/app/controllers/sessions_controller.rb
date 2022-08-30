class SessionsController < ApplicationController

    def new #log in page 
        @user = User.new()
        render :new
    end

    def create #logging in and creating a log in session
        debugger
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user 
            #log in
            redirect_to cats_url 
        else
            redirect_to cats_url
        end
  
        
    end

    def destroy
        #log out method
        logout
        redirect_to new_session_url
        # render :new #this is redirecting to "homepage/login page" 
        #is there a diff between render :new and redirecting to specific  page?
    end
end
