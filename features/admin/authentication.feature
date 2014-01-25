Feature: Admin Authentication
  An admin can sign in to access admin area of the website to perform administrative tasks
  such as editing products, events and faq contents.

  Background:
    Given There are "Cake" and "Special Item" product categories

  Scenario: I can sign in and see the default admin page, which shows the list of products and links to other admin pages
    Given I have an admin account
    When I am at the admin login page
    And I enter my admin credentials
    Then I see the list of products
    And I see links to admin Product page, Event page, and FAQ page
    And I see link to change admin details
    And I see link to sign out

  Scenario: I can sign out 
    Given I am logged in as an admin
    When I sign out
    Then I see the admin login page

  Scenario: admin area is protected
    Given I am not signed in
    When I try to access an admin area
    Then I see the admin login page
