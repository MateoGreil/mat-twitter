class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @article.save
            redirect_to @user
        else
            render 'new'
        end
    end

    def signin
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end
end
