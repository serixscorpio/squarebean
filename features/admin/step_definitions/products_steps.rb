Given(/^I am logged in as an admin$/) do
  @admin = FactoryGirl.create(:admin)
  visit new_user_session_path
  fill_in('user_email', with: @admin.email)
  fill_in('user_password', with: @admin.password)
  click_button('Sign in')
  expect(page).to have_content('Signed in successfully')
end

When(/^I visit the admin Menu page$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I can add:$/) do |table|
    # table is a Cucumber::Ast::Table
    pending # express the regexp above with the code you wish you had
end
