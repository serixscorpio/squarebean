class InquiriesController < ApplicationController
  respond_to :html, :js

  def new
    @inquiry = Inquiry.new
  end

  def create
    inquiry = params[:inquiry]
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.save
      if VisitorMailer.inquire(inquiry).deliver && VisitorMailer.confirm_inquiry(inquiry).deliver
        flash[:notice] = "Thank you for contacting us.  We'll get back to you shortly".html_safe
      else
        flash[:error] = "Couldn't send your message, please double check your email address and try again".html_safe
      end
    else
      flash[:error] = "Email address is invalid"
    end
    @new_inquiry = Inquiry.new

    respond_with(@inquiry) do |f|
      f.html { redirect_to new_inquiry_path }
    end
  end
end
