When(/^I am at the Main page$/) do
  visit root_path
end

Then(/^I see links to About page, Menu page, and Wedding & Catering Events page$/) do
  page.should have_link("About", href: '/about')
  page.should have_link("Menu", href: '/menu')
  page.should have_link("Wedding & Catering Events", href: '/events')
end

When(/^I click on "(.*?)"$/) do |page_name|
  page.find(:link, page_name).click
end

Then(/^I see the "(.*?)" page$/) do |page_name|
  expect(page).to have_title page_name
end
