When(/^I visit the About page$/) do
  visit about_path
end

Then(/^I should see a description about why Square face and why Bean face$/) do
  expect(page.status_code).to be 200
end

