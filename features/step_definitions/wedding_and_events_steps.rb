Given(/^There are Wedding, Special Events, and Catering categories$/) do
  @wedding_category = FactoryGirl.create(:wedding_category)
  @special_events_category = FactoryGirl.create(:special_events_category)
  @catering_category = FactoryGirl.create(:catering_category)
end

When(/^I visit the Wedding & Events page$/) do
  visit events_path
end

Then(/^I see the Wedding, Special Events, and Catering categories$/) do
  expect(page).to have_content("WEDDING")
  expect(page).to have_content("SPECIAL EVENTS")
  expect(page).to have_content("CATERING")
end

Given(/^I am at the Wedding & Events page$/) do
  visit events_path
end

Given(/^the (.*) category has:$/) do |event_category_name, table|
  event_category = EventCategory.where(name: event_category_name).first
  table.hashes.each do |row|
    event_category.events.create! do |e|
      e.name = row['event title']
      e.highlight = row['product highlighted']
      e.description = row['description']
      e.more_details = row['more details']
      e.picture = File.open("features/images/#{row['picture']}")
      e.display_order = row['display order'] || (Event.maximum("display_order") || 0)+1
    end 
  end
end
  
Then(/^I can go through the content of each (.*) event$/) do |event_category_name|
  Event.joins(:event_category).where(event_categories: {name: event_category_name}).each do |event|
    expect(page).to have_content(event.name)
    expect(page).to have_content(event.description)
    #expect(page).to have_content(event.more_details) # TODO: clarify
    # how more details is stored, should it be a url?
    expect(page).to have_xpath("//img[contains(@src, '#{event.picture.event_carousel}')]")
  end
end
