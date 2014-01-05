Given(/^I visit the list of events$/) do
  visit admin_events_path
end

When(/^I enter birthday event:$/) do |table|
  click_link('New event')
  @input = table.rows_hash
  fill_in('event_name', with: @input['event title'])
  select('Birthday', from: "event_event_category_id")
  fill_in('event_highlight', with: @input['product highlighted'])
  fill_in('event_description', with: @input['description'])
  fill_in('event_more_details', with: @input['more details'])
  attach_file('event[picture]', File.join(Rails.root, 'features', 'images', @input['picture']))
  click_button('Save')
end

Then(/^The birthday events is stored$/) do
  fail("Event #{@input['event title']} is not added") unless Event.where(name: @input['event title']).exists? 
end

Then(/^I see the details of the birthday event I just entered$/) do
  expect(page).to have_content(@input['event title'])
  expect(page).to have_content(@input['product highlighted'])
  expect(page).to have_content(@input['description'])
  expect(page).to have_content(@input['more details'])
  expect(page).to have_content("Birthday")
  expect(page).to have_xpath("//img[contains(@src, \"#{@input['picture']}\")]")
end

When(/^I select to edit event "(.*?)"$/) do |event_name|
  event = Event.where(name: event_name).first
  click_link("edit-#{event.id}")
end

When(/^change the event title to "(.*?)"$/) do |new_event_name|
  fill_in('event_name', with: new_event_name)
end

When(/^change the event picture to use "(.*?)"$/) do |picture|
  attach_file('event[picture]', File.join(Rails.root, 'features', 'images', picture))
end

Then(/^the event title becomes "(.*?)"$/) do |name|
  click_button('Save')
  expect(page).to have_content(name)
end

Then(/^the event picture is updated to "(.*?)"$/) do |picture|
  expect(page).to have_xpath("//img[contains(@src, \"#{picture}\")]")
end

When(/^I select to delete event "(.*?)"$/) do |event_name|
  event = Event.where(name: event_name).first
  click_link("delete-#{event.id}")
end

Then(/^the list of events should not have "(.*?)"$/) do |event_name|
  fail("Event #{event_name} should not be found") if Event.where(name: event_name).exists? 
  expect(page).to have_no_selector('td', text: event_name)
end

Then(/^the list of events should still have "(.*?)"$/) do |event_name|
  fail("Event #{event_name} is not found") unless Event.where(name: event_name).exists? 
  expect(page).to have_selector('td', text: event_name)
end

When(/^I visit the admin event page$/) do
  visit admin_events_path
end

Then(/^I see the list of events$/) do
  expect(page).to have_selector("h2.#{@birthday_category.name.downcase.tr(' ', '_')}")
  expect(page).to have_selector("h2.#{@wedding_category.name.downcase.tr(' ', '_')}")
  expect(page).to have_selector("h2.#{@special_events_category.name.downcase.tr(' ', '_')}")
end

