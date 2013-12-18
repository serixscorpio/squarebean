Given(/^these products:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    Product.create! name: row['name'], description: row['description'], picture: File.open("features/images/#{row['picture']}")
  end
end
  
When(/^I visit the product page$/) do
  visit products_path
end

Then(/^I see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I see a picture of a macaroon$/) do
  page.should have_selector("img")
end

Given(/^I have a "(.*?)" category$/) do |name|
  @product_category = ProductCategory.create! name: name
end

Given(/^a "(.*?)" in that category$/) do |product_name|
  product = Product.create! name: product_name, description: "a delicious macaroon", picture: File.open("features/images/macaroon.jpg")
  product.update_attribute(:product_category_id, @product_category)
end

Then(/^I see "(.*?)" in the "(.*?)" category$/) do |product_name, product_category_name|
  page.should have_selector("##{product_category_name.downcase}")
  expect(page.find("##{product_category_name.downcase}")).to have_content(product_name)
end

Given(/^a (.+) "(.*?)"$/) do |diet_types, product_name|
  @product = Product.create! name: product_name
  diet_types.split(', ').each do |diet_type|
    @product.update_attribute(diet_type.gsub(" ", "_").prepend("is_").to_sym, true)
  end
end

Then(/^I see "(.*?)" is indicated as (.+)$/) do |product_name, diet_types|
  diet_types.split(', ').each do |diet_type|
    expect(page.find("##{product_name}")).to have_content(diet_type)
  end
end

