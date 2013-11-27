Feature: Products
  As a bakery, we produce and sell bakery products.

  Scenario: Each product has name, picture, description, price
    Given these products:
      |name    |picture       |description          |
      |Macaroon|macaroon.jpg  |A delicious macaroon |
      |Muffin  |muffin.jpg    |A delicious muffin   |
    When I visit the product page
    Then I see "Macaroon"
    And I see "A delicious macaroon"
    And I see a picture of a macaroon

  Scenario: A product falls into one of two categories
    Given I have a "Specialty" category
    And a "Macaroon" in that category
    When I visit the product page
    Then I see "Macaroon" in the "Specialty" category

  Scenario: A product has certain diet type(s)
    Given a dairy free, gluten free, vegan "Muffin"
    When I visit the product page
    Then I see "Muffin" is indicated as dairy free, gluten free, vegan
