Given(/^these products:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    Product.create! name: row['name'], description: row['description']
  end
end
  
When(/^I visit the product page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a picture of a macaroon$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have a Specialty category$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a Macaroon in that category$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see "(.*?)" in the "(.*?)" category$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^a gluten free diet$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a Cookie that is gluten free$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the home page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^choose to show only gluten free products$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see "(.*?)" which is "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

