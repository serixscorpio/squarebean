Given(/^predefined Q&A content:$/) do |table|
  # table is a Cucumber::Ast::Table
  @faqs = table.hashes
  @faqs.each do |row|
    Faq.create! question: row['question'], answer: row['answer'], display_order: row['order']
  end
end

When(/^I visit the FAQ page$/) do
  visit faq_path
end

Then(/^I should see the list of questions and answers$/) do
  @faqs.each do |row|
    expect(page).to have_content(row['question'])
    expect(page).to have_content(row['answer'])
  end
end

