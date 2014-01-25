Given(/^I have an admin account$/) do
  @admin = FactoryGirl.create(:admin)
end

When(/^I am at the admin login page$/) do
  visit new_user_session_path
end

When(/^I enter my admin credentials$/) do
  fill_in('user_email', with: @admin.email)
  fill_in('user_password', with: @admin.password)
  click_button('Sign in')
end

When(/^I sign out$/) do
  click_link_or_button('Sign out')
end

Then(/^I see the admin login page$/) do
  expect(page).to have_selector(:link_or_button, 'Sign in')
end

Given(/^I am not signed in$/) do
  # no operation
end

When(/^I try to access an admin area$/) do
  visit admin_path
end

Then(/^I see link to change admin details$/) do
  expect(page).to have_selector(:link_or_button, 'Admin details')
end

Then(/^I see link to sign out$/) do
  expect(page).to have_selector(:link_or_button, 'Sign out')
end

