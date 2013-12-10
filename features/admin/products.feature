Feature: Admin Products
  Background:
    Given There are "Cake" and "Special Item" product categories

  Scenario: As an admin, I can add a product
    Given I am logged in as an admin
    When I visit the admin Menu page
    Then I can add:
      |name    |picture       |description          |category     |is gluten free|is dairy free|is vegan|
      |Macaroon|macaroon.jpg  |A delicious macaroon |Special Item |Yes           |Yes          |Yes     |
