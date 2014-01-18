Feature: Menu
  As a bakery, we produce and sell bakery products.
  This page shows the available bakery products.

  Background:
    Given There are "Cake" and "Special Item" product categories

  Scenario: Each product has name, picture, description, price.  
    A product fall into either Special Item or Cake category

    Given these products:
      |name    |description          |category     |price|featured picture|
      |Macaroon|A delicious macaroon |Special Item |32   |macaroon.jpg    |
      |Muffin  |A delicious muffin   |Cake         |25   |muffin.jpg      |
    When I visit the product page
    Then I see "Macaroon" in the Specialty category
    And I see "A delicious macaroon"
    And I see a picture of a macaroon
    And I see the price of "Macaroon" is "32"

  Scenario: A product has certain diet type(s)
    Given a dairy free, gluten free, vegan "Muffin"
    When I visit the product page
    Then I see "Muffin" is indicated as dairy free, gluten free, vegan
