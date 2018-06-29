class RequestsController < ApplicationController
  before_action :set_request, only: [:download, :mail]

  def index
    @requests = Request.where(user_id: current_user.id)
  end

  def download
    respond_to do |format|
      format.pdf do
        @document = Document::PDF.call(template: @request.template, data: @request.data).data 
        send_data @document,
                  filename: "#{@request.template.name}.pdf",
                  type: 'application/pdf' 
      end
    end
  end

  def mail
    RequestMailer.document_email(@request.id).deliver_later
    flash.now[:success] = 'Email triggered'
    redirect_to requests_path
  end

  private 

  def set_request
    request_id = params[:id] || params[:request_id]
    @request = Request.find_by(id: request_id)
    unless @request.present?
      flash.now[:notice] = 'Request not found'
      redirect_back(fallback_location: root_path)
    end
  end
end
