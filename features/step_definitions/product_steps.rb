Given(/^these products:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    Product.create! name: row['name'], description: row['description'], picture: File.open("features/images/#{row['picture']}")
  end
end
  
When(/^I visit the product page$/) do
  visit products_path
end

Then(/^I see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I see a picture of a macaroon$/) do
  page.should have_selector("img")
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

