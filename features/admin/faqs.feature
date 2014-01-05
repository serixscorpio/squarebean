Feature: Admin FAQs
  Background:
    Given I am logged in as an admin

  Scenario: I can add a new FAQ
    Given I visit the list of FAQs
    When I enter FAQ:
      | question  | Can you make muffins gluten-free? |
      | answer    | Yes                               |
      | order     | 1                                 |
    Then The FAQ is stored
    And I see the details of the FAQ I just entered

  Scenario: I can edit an existing FAQ
    Given the following FAQs:
      | question        | answer  | order |
      | Do you deliver? | Yes     | 1     |
    And I visit the list of FAQs
    When I select to edit FAQ "Do you deliver?"
    And change the faq question to "Do you deliver to more than 10 miles away?"
    And change the faq answer to "No"
    Then the faq question becomes "Do you deliver to more than 10 miles away?"
    And the faq answer becomes "No"
    
  Scenario: I can delete an existing FAQ
    Given the following FAQs:
      | question            | answer  | order |
      | Do you deliver?     | Yes     | 1     |
      | Do you make mochi?  | Sure!   | 2     |
    And I visit the list of FAQs
    When I select to delete FAQ "Do you deliver?"
    Then the list of FAQs should not have "Do you deliver?"
    But the list of FAQs should still have "Do you make mochi?"

  Scenario: I can change the ordering of existing FAQs
    Given the following FAQs:
      | question            | answer  | order |
      | Do you deliver?     | Yes     | 1     |
      | Do you make mochi?  | Sure!   | 2     |
    And I visit the list of FAQs
    When I change the order of "Do you deliver?" to "3"
    Then the order of "Do you deliver?" becomes "3"

  Scenario: The admin FAQ page shows the list of FAQs and links to other admin pages
    When I visit the admin FAQ page
    Then I see the list of FAQs 
    And I see links to admin Product page, Event page, and FAQ page
