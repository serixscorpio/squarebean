Given(/^There are "(.*?)" and "(.*?)" product categories$/) do |product_category1, product_category2|
  FactoryGirl.create(:cake_category)
  FactoryGirl.create(:special_item_category)
end

Given(/^I am logged in as an admin$/) do
  @admin = FactoryGirl.create(:admin)
  visit new_user_session_path
  fill_in('user_email', with: @admin.email)
  fill_in('user_password', with: @admin.password)
  click_button('Sign in')
  expect(page).to have_content('Signed in successfully')
end

When(/^I visit the admin Menu page$/) do
  visit admin_products_path
end

Then(/^I can add:$/) do |table|
  row = table.hashes.first 
  click_link('New Product')
  fill_in('product_name', with: row['name'])
  fill_in('product_description', with: row['description'])
  select(row['category'], from: 'product[product_category_id]')
  check('product[is_gluten_free]') if row['is gluten free'] == 'Yes'
  check('product[is_dairy_free]') if row['is dairy free'] == 'Yes'
  check('product[is_vegan]') if row['is vegan'] == 'Yes'
  attach_file('product[picture]', File.join(Rails.root, 'features', 'images', row['picture file']))
  click_button('Create Product')
  fail("Product #{row['name']} is not added") unless Product.where(name: row['name']).exists? 
  expect(page).to have_content(row['name'])
  expect(page).to have_content(row['description'])
  # TODO:
  #expect(page).to have_content(row['category'])
  pending
end
