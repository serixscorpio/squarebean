Given(/^these products:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    product_category = ProductCategory.where(name: row['category']).first
    product_category.products.create! name: row['name'], description: row['description'], picture: File.open("features/images/#{row['picture']}")
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

Then(/^I see "(.*?)" in the Specialty category$/) do |product_name|
  within(:xpath, "//h2[text()='Special Item']/../../..") do
    expect(page).to have_content(product_name)
  end
end

Given(/^a (.+) "(.*?)"$/) do |diet_types, product_name|
  @product = ProductCategory.find(1).products.create! name: product_name
  diet_types.split(', ').each do |diet_type|
    @product.update_attribute(diet_type.gsub(" ", "_").prepend("is_").to_sym, true)
  end
end

Then(/^I see "(.*?)" is indicated as (.+)$/) do |product_name, diet_types|
  diet_types.split(', ').each do |diet_type|
    within(:xpath, "//h4[text()='#{product_name}']/..") do
      expect(page).to have_content(diet_type)
    end
  end
end

