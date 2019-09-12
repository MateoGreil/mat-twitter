class HomepageController < ApplicationController
    before_action :authenticate, only: :connect

    def index
        @user = User.find_by(id: session[:current_user_id])
        logger.debug @user
    end

    def connect
        @user = User.find_by(id: session[:current_user_id])
    end
end
