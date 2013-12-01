class VisitorMailer < ActionMailer::Base
  default from: "serixscorpio@gmail.com", to: "serixscorpio@gmail.com"

  def inquire(inquiry)
    @inquiry = inquiry
    mail(from: @inquiry["email"], subject: "Inquiry from #{@inquiry['name']}")
  end

  def confirm_inquiry(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry["email"], subject: "Thank you! Square Bean received your inquiry")
  end
end
