class ChatsController < ApplicationController
  # before_action :set_application
  # before_action :set_application_chat, only: [:show, :update, :destroy]

  # GET /applications/:application_id/chats
  def index
    json_response(application.chats)
  end

  # GET /applications/:applications_token/chats/:number
  def show
    application= Application.find_by(application_token: params[:application_token])
    chat= application.chats.find_by(number: params[:number])
    data = {
      number: chat.number,
      messages: chat.messages
    }
    render json: {data:data}, status: :ok
  end

  # POST /applications/:application_token/chats
  def create
    application= Application.find_by(application_token: params[:application_token]).perform_async
  
    application.chats.create!(chat_params)
    json_response(application.chats.last, :created)
    render status: :created
  end

  # PUT /applications/:application_id/chats/:id
  def update
  # chat.find
    application=Application.find_by(application_token: params[:application_token])
    chat= application.chats.find_by(number: params[:number])

    if chat=application.chats.update_attributes(params[:number])
      render json: {data:application}, status :updated
    else
      render json: {data:application.erros}, status: :unprocessable_entity
    end
  end



  private

  def chat_params
    params.permit(:id, :done)
  end


end
