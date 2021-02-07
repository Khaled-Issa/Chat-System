class ApplicationsController < ApplicationController
  # GET /applications
  def index
    applications = Application.all
    render json: {data: applications}, status: :ok
  end

  # POST /applications
  def create
    #we’re using create! instead of create. This way, the model will raise
    # an exception ActiveRecord::RecordInvalid. This way, we can avoid deep nested if statements in the controller. Thus, we rescue from this exception
    # in the ExceptionHandler module.
    application = Application.create!(application_params)
    if application.save
      render json: {data:application}, status: :created
    else
    render json: {status:'ERROR',message:'application not created', data:application.errors}, status: :unprocessable_entity
    end
  end

  # GET /applications/:name
  def show
    application= Application.find_by(application_token: params[:token])

    data = {
      token: application.application_token,
      chats_count: application.chats_count,
      chats: application.chats_with_messages
    }
    render json: {status:'SUCCESS', message:'Loaded article', data:data}, status: :ok
  end

  # PUT /applications/:name
  def update
    application = Application.find_by(application_token: params[:token])
    if application.update_attributes(application_params)
      render json: {status: 'SUCCESS', message:'Update', data:application}
    else
      render json: {status:'ERROR', message:'Apllication not updated', data:application.erros}, status: :unprocessable_entity
    end
  end


  private

  def application_params
    # whitelist params
    params.permit(:name)
  end


end
