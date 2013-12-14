Feature: Admin Products
  Background:
    Given There are "Cake" and "Special Item" product categories
    And I am logged in as an admin

  Scenario: I can add a new product
    Given I visit the list of products
    Then I can add:
      |name    |picture       |description          |category     |is gluten free|is dairy free|is vegan|picture file       |
      |Macaroon|macaroon.jpg  |A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg       |
      |Muffin  |muffin.jpg    |A tasy muffin        |Special Item |Yes           |No           |No      |muffin.jpg         |

  Scenario: I can edit an existing product
    Given these products:
      |name    |picture       |description          |category     |is gluten free|is dairy free|is vegan|picture file       |
      |Macaroon|macaroon.jpg  |A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg       |
      |Muffin  |muffin.jpg    |A tasy muffin        |Special Item |Yes           |No           |No      |muffin.jpg         |
    And I visit the list of products
    When I select to edit the "Macaroon"
    And change the name to "Delicious Macaroon"
    And change the picture to use "macaroon1.jpg"
    Then its name becomes "Delicious Macaroon"
    And its picture is updated to "macaroon1.jpg"

  Scenario: I can delete an existing product
    Given these products:
      |name    |picture       |description          |category     |is gluten free|is dairy free|is vegan|picture file       |
      |Macaroon|macaroon.jpg  |A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg       |
      |Muffin  |muffin.jpg    |A tasy muffin        |Special Item |Yes           |No           |No      |muffin.jpg         |
    And I visit the list of products
    When I select to delete the "Macaroon"
    Then The list of products should not have "Macaroon"
    And The list of products should still have "Muffin"
