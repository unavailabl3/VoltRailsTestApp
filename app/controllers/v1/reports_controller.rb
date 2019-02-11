class V1::ReportsController < ApplicationController
  before_action :json_format
  #before_action :authorize_request

  def generate
    needed_params
    ReportWorker.perform_async(params[:email], params[:start_date], params[:end_date])
    render json: { message: "Report generation started. It will be sent to #{params[:email]}" }, status: :ok
  end

  private

    def json_format
      render plain: "Wrong format" unless params[:format] == 'json'
    end

    def needed_params
      params.require(:start_date)
      params.require(:end_date)
      params.require(:email)
    end

end
