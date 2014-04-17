class InquiriesController < ApplicationController
  respond_to :html, :js

  def new
    @inquiry = Inquiry.new
  end

  def create
    result = SendInquiry.perform(inquiry_params)    
    if result.success?
      flash[:notice] = result.notice
    else
      flash[:error] = result.error
    end
    @inquiry = result.sent_inquiry

    respond_with(@inquiry) do |format|
      format.html { redirect_to new_inquiry_path }
    end
  end

  private 

  def inquiry_params
    # strong parameters to be added here when available
    params[:inquiry]
  end
end
