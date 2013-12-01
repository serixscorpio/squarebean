class InquiriesController < ApplicationController
  def create
    inquiry = params[:inquiry]
    if VisitorMailer.inquire(inquiry).deliver && VisitorMailer.confirm_inquiry(inquiry).deliver
      flash[:notice] = "Thank you for contacting us.  We'll get back to you shortly"
    else
      flash[:notice] = "Couldn't send your message, please double check your email address and try again"
    end
    redirect_to root_path
  end
end
