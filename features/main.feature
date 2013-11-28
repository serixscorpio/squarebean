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
