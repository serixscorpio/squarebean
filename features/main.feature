Feature: Main
  This is the main page, which is where all visitors arrive.

  Scenario: I can see the Main page
    When I am at the Main page
    Then I see links to About page, Menu page, and Wedding & Catering Events page

  Scenario Outline: visiting other pages from Main page
    When I am at the Main page
    And I click on "<page name>"
    Then I see the "<page name>" page

    Examples:
      | page name |
      | About |
      | Menu |
      | Wedding & Catering Events |

  Scenario: I can contact Square Bean
    Given I have valid email address "serixscorpio@gmail.com"
    And My name is "Eric Chiang"
    And I have inquiry "Do you make taro cakes?"
    When I am at the Main page
    And I submit my name, email address and inquiry
    Then I see "Thank you for contacting us.  We'll get back to you shortly"
    And an email is sent from my email address to Square Bean
    And a confirmation email is sent from Square Bean to my email address

  Scenario: I cannot contact Square Bean using an invalid email address
    Given I have invalid email address "eric.chiang@com"
    And My name is "Eric Chiang"
    And I have inquiry "Do you make taro cakes?"
    When I am at the Main page
    And I submit my name, email address and inquiry
    Then I see "Email address is invalid"
