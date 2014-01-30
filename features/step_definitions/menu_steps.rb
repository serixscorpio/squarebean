Given(/^these products:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each_with_index do |row, i|
    product_category = ProductCategory.where(name: row['category']).first
    product = product_category.products.new do |p|
      p.name = row['name']
      p.description = row['description']
      p.display_order = row['order'] || i+1
      p.is_gluten_free = row['is_gluten_free']
      p.is_dairy_free = row['is_dairy_free']
      p.is_vegan = row['is_vegan']
      p.price = row['price']
    end
    product.save!
    ['featured picture', 'picture2', 'picture3'].each_with_index do |picture, picture_order|
      unless row[picture].nil?
        product.product_pictures.create! path: File.open("features/images/#{row[picture]}"), display_order: picture_order+1
      end
    end
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
  within(:xpath, "//h2[text()='Special Items']/../../..") do
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

Then(/^I see the price of "(.*?)" is "(.*?)"$/) do |product_name, price|
  within(:xpath, "//h4[text()='#{product_name}']") do
    expect(page).to have_selector(:xpath, '//ul[@class="price"]/li', text: price.to_s)
  end
end

