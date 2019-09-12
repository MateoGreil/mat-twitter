class MessagesController < ApplicationController
    before_action :authenticate

    def index
        @messages = Message.all
    end

    def new
        @message = Message.new
    end

    def create
        @user = User.find_by(id: session[:current_user_id])
        @message = @user.messages.create(message_params)
        redirect_to user_path(@user)
    end

    def show
        @message = Message.find(params[:id])
    end

    def edit
        @message = Message.find(params[:id])
    end

    def update
        @message = Message.find(params[:id])

        if @message.update(message_params)
            redirect_to @message
        else
            render 'edit'
        end
    end

    def destroy
        @message = Message.find(params[:id])

        @message.destroy
        redirect_to messages_path
    end

    private
        def message_params
            params.require(:message).permit(:text)
        end
end
