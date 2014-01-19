Feature: Contact Square Bean
  This is the contact page of the Square Bean website
  Visitors can submit messages to contact Square Bean

  Scenario: I can contact Square Bean
    Given I have valid email address "serixscorpio@gmail.com"
    And My name is "Eric Chiang"
    And I have inquiry "Do you make taro cakes?"
    When I am at the contact page
    And I submit my name, email address and inquiry
    Then I see "Thank you for contacting us.  We'll get back to you shortly"
    And an email is sent from my email address to Square Bean
    And a confirmation email is sent from Square Bean to my email address

  Scenario: I cannot contact Square Bean using an invalid email address
    Given I have invalid email address "eric.chiang@com"
    And My name is "Eric Chiang"
    And I have inquiry "Do you make taro cakes?"
    When I am at the contact page
    And I submit my name, email address and inquiry
    Then I see "Email address is invalid"
