Given(/^predefined Q&A content:$/) do |table|
  # table is a Cucumber::Ast::Table
  @faqs = table.hashes
  @faqs.each do |row|
    Faq.create! question: row['Question'], answer: row['Answer'], display_order: row['order']
  end
end

When(/^I visit the FAQ page$/) do
  visit faq_path
end

Then(/^I should see the list of questions and answers$/) do
  @faqs.each do |row|
    expect(page).to have_content(row['Question'])
    expect(page).to have_content(row['Answer'])
  end
end

