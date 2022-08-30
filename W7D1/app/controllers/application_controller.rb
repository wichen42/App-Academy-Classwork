class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user # looks up user with the current session token
        @current_user ||= User.find_by(session_token: session[:session_token] )
    end

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def logged_in?
        !!@current_user
    end

    def logout
        @current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

end