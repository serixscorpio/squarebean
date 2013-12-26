Given(/^There are Wedding, Birthday, and Special Events categories$/) do
  FactoryGirl.create(:wedding_category)
  FactoryGirl.create(:birthday_category)
  FactoryGirl.create(:special_events_category)
end

When(/^I visit the Wedding & Events page$/) do
  visit events_path
end

Then(/^I see the Wedding, Birthday, and Special Events categories$/) do
  expect(page).to have_content("WEDDING")
  expect(page).to have_content("BIRTHDAY")
  expect(page).to have_content("SPECIAL EVENTS")
end

Given(/^I am at the Wedding & Events page$/) do
  visit events_path
end

Given(/^the Birthday category has:$/) do |table|
  birthday_category = EventCategory.where(name: "Birthday").first
  table.hashes.each do |row|
    birthday_category.events.create! name: row['event title'], highlight: row['product highlighted'], description: row['description'], more_details: row['more details'], picture: File.open("features/images/#{row['picture']}")
  end
end
  
Then(/^I can go through the content of each Birthday event$/) do
  Event.joins(:event_category).where(event_categories: {name: "Birthday"}).each do |birthday_event|
    expect(page).to have_content(birthday_event.name)
    #expect(page).to have_content(birthday_event.highlight) # TODO: clarify if
    # the highlight field is needed.
    expect(page).to have_content(birthday_event.description)
    #expect(page).to have_content(birthday_event.more_details) # TODO: clarify
    # how more details is stored, should it be a url?
    expect(page).to have_xpath("//img[contains(@src, \"#{birthday_event.picture}\")]")
  end
end
