class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params.except(:password_confirmation))
        if user_params[:password_confirmation] == user_params[:password]    
            if @user.save
                redirect_to root_path
            else
                render 'new'
            end
        else
            @user.errors.add(:password, 'Password correspond pas')
            render 'new'
        end
    end

    def signin
        
    end

    private
        def user_params
            @user_params ||= params.require(:user).permit(:email, :name, :password, :password_confirmation)
        end
end