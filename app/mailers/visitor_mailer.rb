class VisitorMailer < ActionMailer::Base
  default from: ENV['CONTACT_EMAIL'], to: ENV['CONTACT_EMAIL']

  def inquire(inquiry)
    @inquiry = inquiry
    mail(from: @inquiry["email"], subject: "Inquiry from #{@inquiry['name']}")
  end

  def confirm_inquiry(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry["email"], subject: "Thank you! Square Bean received your inquiry")
  end
end
