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

