When(/^I am at the contact page$/) do
  visit new_inquiry_path
end

Given(/^I have (valid|invalid) email address "(.*?)"$/) do |email_validity, email_address|
  @email_address = email_address
  stub_request(:get,
               Figaro.env.mailgun_email_validation_api_protocol +
               Figaro.env.mailgun_email_validation_id + ":" +
               Figaro.env.mailgun_email_validation_key + "@" + 
               Figaro.env.mailgun_email_validation_api_path)
    .with(query: {"address" => @email_address})
    .to_return(File.new("features/http_responses/mailgun_api_#{email_validity}_email_response"))
end

Given(/^My name is "(.*?)"$/) do |visitor_name|
  @visitor_name = visitor_name
end

Given(/^I have inquiry "(.*?)"$/) do |inquiry_content|
  @inquiry_content= inquiry_content
end

When(/^I submit my name, email address and inquiry$/) do
  fill_in('inquiry[name]', with: @visitor_name)
  fill_in('inquiry[email]', with: @email_address)
  fill_in('inquiry[content]', with: @inquiry_content)
  click_button "send"
end

Then(/^an email is sent from my email address to Square Bean$/) do
  @email = ActionMailer::Base.deliveries.first
  expect(@email.from).to eq([@email_address])
  expect(@email.to).to eq([ENV["CONTACT_EMAIL"]])
  expect(@email.subject).to include("Inquiry from #{@visitor_name}")
  expect(@email.body).to include(@inquiry_content)
end

Then(/^a confirmation email is sent from Square Bean to my email address$/) do
  @email = ActionMailer::Base.deliveries[1]
  expect(@email.from).to eq([ENV["CONTACT_EMAIL"]])
  expect(@email.to).to eq([@email_address])
  expect(@email.subject).to eq("Thank you! Square Bean received your inquiry")
  expect(@email.body).to include("We'll get back to you shortly")      
end

