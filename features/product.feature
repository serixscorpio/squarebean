Feature: Products
  As a bakery, we produce and sell bakery products.

  Scenario: Each product has name, picture, description, price and diet type
    Given these products:
      |name   |picture    |description      |diet type|
      |Macaroon|macaroon.jpg|A delicious macaroon|none  |
      |Muffin   |muffin.jpg   |A delicious muffin|none|
    When I visit the product page
    Then I see "Macaroon"
    And I see "A delicious macaroon"
    And I see a picture of a macaroon

  Scenario: A product falls into one of two categories
    Given I have a Specialty category
    And a Macaroon in that category
    When I visit the product page
    Then I see "Macaroon" in the "Specialty" category

  Scenario: I can select products for a certain diet
    Given a gluten free diet
    And a Cookie that is gluten free
    When I visit the home page
    And choose to show only gluten free products
    Then I see "Cookie"
