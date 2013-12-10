Feature: Admin Products
  Scenario: As an admin, I can add a product
    Given I am logged in as an admin
    When I visit the admin Menu page
    Then I can add:
      |name    |picture       |description          |
      |Macaroon|macaroon.jpg  |A delicious macaroon |
