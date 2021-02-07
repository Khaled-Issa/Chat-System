class MessagesController < ApplicationController
    # before_action :set_application
    # before_action :set_application_chat, only: [:show, :update, :destroy]
  
    # GET /applications/:application_token/chats
    def index
      chat = Application.find_by(application_token: params[:application_token]).chats.find_by(number: params[:chat_number])

      json_response(chat.messages)
    end
  
  
    # POST /applications/:application_token/chats
    def create
      chat = Application.find_by(application_token: params[:application_token]).chats.find_by(number: params[:chat_number]).perform_async
      chat.messages.create!(message_params)
      json_response(chat.messages.last, :created)
    end
  
    # PUT /applications/:application_token/chats/:number
    def update
      chat = Application.find_by(application_token: params[:application_token]).chats.find_by(number: params[:chat_number])
      message= chat.messages.find_by(number: params[:number])
      message.update(message_params)
    end
  
  
    private
  
    def message_params
      params.permit(:message)
    end
  
    # def set_application
    #   application = Application.find(params[:applications_token])
    # end
  
    # def set_application_chat
    #   chat = application.chats.find_by!(id: params[:applications_token]) if application
    # end
  
  end
  