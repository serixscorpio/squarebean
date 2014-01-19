When(/^I am at the Main page$/) do
  visit root_path
end

Then(/^I see links to About page, Menu page, Event page, FAQ page, and Contact page$/) do
  expect(page).to have_selector('li.clickable', text: 'about')
  expect(page).to have_selector('li.clickable', text: 'menu')
  expect(page).to have_selector('li.clickable', text: 'event')
  expect(page).to have_selector('li.clickable', text: 'FAQ')
  expect(page).to have_selector('li.clickable', text: 'contact')
end

When(/^I click on "(.*?)"$/) do |page_name|
  page.find('ul.mainnav li.clickable', text: page_name).click
end

Then(/^I see the "(.*?)" page$/) do |page_name|
  expect(page).to have_selector "section.#{page_name.downcase}"
end

