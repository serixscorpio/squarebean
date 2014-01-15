Given(/^There are "(.*?)" and "(.*?)" product categories$/) do |product_category1, product_category2|
  @cake_category = FactoryGirl.create(:cake_category)
  @special_item_category = FactoryGirl.create(:special_item_category)
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

  click_link('Add a picture')
  last_picture_field = all('.fields').last
  within(last_picture_field) do
    attach_file('Product Picture', File.join(Rails.root, 'features', 'images', row['picture file1']))
    fill_in "Display Order", with: 1
  end

  click_link('Add a picture')
  last_picture_field = all('.fields').last
  within(last_picture_field) do
    attach_file('Product Picture', File.join(Rails.root, 'features', 'images', row['picture file2']))
    fill_in "Display Order", with: 2
  end

  click_link('Add a picture')
  last_picture_field = all('.fields').last
  within(last_picture_field) do
    attach_file('Product Picture', File.join(Rails.root, 'features', 'images', row['picture file3']))
    fill_in "Display Order", with: 3
  end

  click_button('Save')
  expect(page).to have_content(row['name'])
  expect(page).to have_content(row['description'])
  expect(page).to have_content(row['category'])
  expect(page).to have_content('gluten free') if row['is gluten free'] == 'Yes'
  expect(page).to have_content('dairy free') if row['is dairy free'] == 'Yes'
  expect(page).to have_content('vegan') if row['is vegan'] == 'Yes'
  expect(page).to have_xpath("//img[contains(@src, \"#{row['picture file1']}\")]")
  expect(page).to have_xpath("//img[contains(@src, \"#{row['picture file2']}\")]")
  expect(page).to have_xpath("//img[contains(@src, \"#{row['picture file3']}\")]")
end

When(/^I select to edit the "(.*?)"$/) do |product_name|
  click_link("edit-#{product_name}")
end

When(/^change the name to "(.*?)"$/) do |new_name|
  fill_in('product_name', with: new_name)
end

When(/^change the picture to use "(.*?)"$/) do |new_picture|
  picture_field = all('.fields').first 
  within(picture_field) do
    attach_file('Product Picture', File.join(Rails.root, 'features', 'images', new_picture))
  end
  click_button('Save')
end

Then(/^its name becomes "(.*?)"$/) do |new_name|
  expect(page).to have_content(new_name)
end

Then(/^its picture is updated to "(.*?)"$/) do |new_picture|
  expect(page).to have_xpath("//img[contains(@src, \"#{new_picture}\")]")
end

When(/^I select to delete the "(.*?)"$/) do |product_name|
  click_link("delete-#{product_name}")
end

Then(/^The list of products should not have "(.*?)"$/) do |product_name|
  fail("Product #{product_name} should not be found") if Product.where(name: product_name).exists? 
  expect(page).to have_selector(:xpath, '//div[@class="flash-notice"]', text: product_name)
end

Then(/^The list of products should still have "(.*?)"$/) do |product_name|
  fail("Product #{product_name} is not found") unless Product.where(name: product_name).exists? 
  expect(page).to have_selector('div', text: product_name)
end

When(/^I visit the default admin page$/) do
  visit admin_path
end

Then(/^I see the list of products$/) do
  expect(page).to have_selector("h2.#{@cake_category.name.downcase.tr(' ', '_')}")
  expect(page).to have_selector("h2.#{@special_item_category.name.downcase.tr(' ', '_')}")
end

Then(/^I see links to admin Product page, Event page, and FAQ page$/) do
  expect(page).to have_link('Product', href: '/admin/products')
  expect(page).to have_link('Event', href: '/admin/events')
  expect(page).to have_link('FAQ', href: '/admin/faqs')
end

When(/^I change the order of product "(.*?)" to "(.*?)"$/) do |product_name, desired_order|
  product = Product.where(name: product_name).first
  within("//form[@id='edit_product_#{product.id}']") do
    fill_in "product_display_order", with: desired_order
    click_button("update")
  end
end

Then(/^the order of product "(.*?)" becomes "(.*?)"$/) do |product_name, expected_order|
  product = Product.where(name: product_name).first
  fail("product's order incorrect") unless product.display_order == expected_order.to_i
end

