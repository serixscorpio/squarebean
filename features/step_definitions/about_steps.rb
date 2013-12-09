When(/^I visit the About page$/) do
  visit about_path
end

Then(/^I should see a description about why Square face and why Bean face$/) do
  page.should have_content("That is how we came to existence.")
  page.should have_content("We are an exclusively online make-to-order virtual shop that specializes western desserts with Asian twists with an emphasis on chiffon cakes that are moist and light. Customization is one of the things that sets us apart from other dessert shops. Our flavor profiles allow each ingredient to shine, yet blens nicely with each other. Please inspire us with your favorite combination of flavors!")
end

