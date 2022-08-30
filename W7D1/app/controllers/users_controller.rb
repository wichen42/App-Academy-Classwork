class UsersController < ApplicationController

   def new
    @user = User.new()
    render :new
   end
   
   def create
    @user = User.new(user_params)
    if @user.save
        #update later with login method so that if the user save occurs, page redirects to cats index with Welcome and auto login
        login(@user)
        redirect_to cats_url #change later
    else
        render :new
    end

   end

   private
   def user_params
    params.require(:user).permit(:username, :password)
   end

end
