class HomepageController < ApplicationController
    def index
        @user = User.find_by(id: session[:current_user_id])
        logger.debug @user
    end
end
