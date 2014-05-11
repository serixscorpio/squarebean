class SendInquiry
  include Interactor

  def setup
    context.fail! unless context[:email].present? && context[:name].present?
  end

  def perform
    inquiry = Inquiry.new(context)
    if inquiry.save
      if VisitorMailer.inquire(context).deliver && VisitorMailer.confirm_inquiry(context).deliver
        context[:notice] = "Thank you for contacting us.  We'll get back to you shortly".html_safe
      else
        context.fail!(error: "Couldn't send your message, please double check your email address and try again".html_safe)
      end
    else
      context.fail!(error: "Email address is invalid".html_safe)
    end
    context[:sent_inquiry] = inquiry
  end
end
