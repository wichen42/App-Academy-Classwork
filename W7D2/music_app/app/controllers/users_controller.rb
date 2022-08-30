class UsersController < ApplicationController

    def create # signup user
        @user = User.new(user_params)
        if @user.save!
            render json: @user
        else
            redirect_to new_user_url
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def new # signup page
        @user = User.new()
        render :new
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end

end