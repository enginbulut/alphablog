class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find(session[:userid]) if session[:userid]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:danger]="You must be logged in to perform that action"
            redirect_to root_path
        end
    end

    

end
