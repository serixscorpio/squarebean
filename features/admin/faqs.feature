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
