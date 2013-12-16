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
  # TODO: create events with birthday category
  @birthday_category = EventCategory.where(name: "Birthday")
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    @birthday_category.events.create! name: row['event title'], highlight: row['product highlighted'], description: row['description'], more_details: row['more details'], picture: File.open("features/images/#{row['picture']}")
  end
end
  
Then(/^I can go through the content of each Birthday event$/) do
  # TODO: only pick birthday events
  Event.all.each do |birthday_event|
    expect(page).to have_content(birthday_event.name)
    expect(page).to have_content(birthday_event.highlight)
    expect(page).to have_content(birthday_event.description)
    expect(page).to have_content(birthday_event.more_details)
    expect(page).to have_xpath("//img[contains(@src, \"#{birthday_event.picture}\")]")
  end
end
