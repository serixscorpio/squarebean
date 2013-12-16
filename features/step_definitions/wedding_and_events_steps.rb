When(/^I visit the Wedding & Events page$/) do
  visit events_path
end

Then(/^I see the Wedding, Birthday, and Special Events categories$/) do
  expect(page).to have_content("Wedding")
  expect(page).to have_content("Birthday")
  expect(page).to have_content("Special Events")
end

Given(/^I am at the Wedding & Events page$/) do
  visit events_path
end

Given(/^the Birthday category has:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    Event.create! name: row['event title'], highlight: row['product highlighted'], description: row['description'], more_details: row['more details'], picture: File.open("features/images/#{row['picture']}")
  end
end
  
Given(/^"(.*?)" event is shown$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I go to the next Birtday event$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the event "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^The product highlighted is "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

