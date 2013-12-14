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

Given(/^I visit the list of products$/) do
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
  click_button('Save')
  fail("Product #{row['name']} is not added") unless Product.where(name: row['name']).exists? 
  expect(page).to have_content(row['name'])
  expect(page).to have_content(row['description'])
  expect(page).to have_content(row['category'])
  expect(page).to have_content('gluten free') if row['is gluten free'] == 'Yes'
  expect(page).to have_content('dairy free') if row['is dairy free'] == 'Yes'
  expect(page).to have_content('vegan') if row['is vegan'] == 'Yes'
  expect(page).to have_xpath("//img[contains(@src, \"#{row['picture file']}\")]")
end

When(/^I select to edit the "(.*?)"$/) do |product_name|
  click_link("edit-#{product_name}")
end

When(/^change the name to "(.*?)"$/) do |new_name|
  fill_in('product_name', with: new_name)
end

When(/^change the picture to use "(.*?)"$/) do |new_picture|
  attach_file('product[picture]', File.join(Rails.root, 'features', 'images', new_picture))
  click_button('Save')
end

Then(/^its name becomes "(.*?)"$/) do |new_name|
  @product = Product.find_by_name!(new_name)
end

Then(/^its picture is updated to "(.*?)"$/) do |new_picture|
  expect(@product.picture.url).to include(new_picture)
end

When(/^I select to delete the "(.*?)"$/) do |product_name|
  click_link("delete-#{product_name}")
end

Then(/^The list of products should not have "(.*?)"$/) do |product_name|
  fail("Product #{product_name} should not be found") if Product.where(name: product_name).exists? 
  expect(page).to have_no_selector('td', text: product_name)
end

Then(/^The list of products should still have "(.*?)"$/) do |product_name|
  fail("Product #{product_name} is not found") unless Product.where(name: product_name).exists? 
  expect(page).to have_selector('td', text: product_name)
end

