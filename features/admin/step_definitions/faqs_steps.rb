Given(/^I visit the list of FAQs$/) do
  visit admin_faqs_path
end

When(/^I enter FAQ:$/) do |table|
  click_link("New faq")
  @input = table.rows_hash
  fill_in "faq_question", with: @input['question']
  fill_in "faq_answer", with: @input['answer']
  fill_in "faq_display_order", with: @input['order']
  click_button('Save')
end

Then(/^The FAQ is stored$/) do
  fail("FAQ is not added") unless Faq.where(question: @input['question']).exists? 
end

Then(/^I see the details of the FAQ I just entered$/) do
  expect(page).to have_content(@input['question'])
  expect(page).to have_content(@input['answer'])
  expect(page).to have_content(@input['display_order'])
end

Given(/^the following FAQs:$/) do |table|
  table.hashes.each do |row|
    Faq.create! question: row['question'], answer: row['answer'], display_order: row['order']
  end
end

When(/^I select to edit FAQ "(.*?)"$/) do |faq_question|
  faq = Faq.where(question: faq_question).first
  click_link("edit-#{faq.id}")
end

When(/^change the faq question to "(.*?)"$/) do |edited_faq_question|
  fill_in "faq_question", with: edited_faq_question
end

When(/^change the faq answer to "(.*?)"$/) do |edited_faq_answer|
  fill_in "faq_answer", with: edited_faq_answer
end

Then(/^the faq question becomes "(.*?)"$/) do |edited_faq_question|
  click_button('Save')
  expect(page).to have_content(edited_faq_question)
end

Then(/^the faq answer becomes "(.*?)"$/) do |edited_faq_answer|
  expect(page).to have_content(edited_faq_answer)
end

When(/^I select to delete FAQ "(.*?)"$/) do |faq_question|
  faq = Faq.where(question: faq_question).first
  click_link("delete-#{faq.id}")
end

Then(/^the list of FAQs should not have "(.*?)"$/) do |faq_question|
  fail("FAQ '#{faq_question}' should not be found") if Faq.where(question: faq_question).exists? 
  expect(page).to have_no_selector('td', text: faq_question)
end

Then(/^the list of FAQs should still have "(.*?)"$/) do |faq_question|
  fail("FAQ '#{faq_question}' is not found") unless Faq.where(question: faq_question).exists? 
  expect(page).to have_selector('td', text: faq_question)
end

