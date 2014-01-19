class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    inquiry = params[:inquiry]
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.save
      if VisitorMailer.inquire(inquiry).deliver && VisitorMailer.confirm_inquiry(inquiry).deliver
        flash[:notice] = "Thank you for contacting us.  We'll get back to you shortly"
      else
        flash[:notice] = "Couldn't send your message, please double check your email address and try again"
      end
    else
      flash[:error] = "Email address is invalid"
    end
    redirect_to new_inquiry_path
  end
end
