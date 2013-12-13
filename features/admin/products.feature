Feature: Admin Products
  Background:
    Given There are "Cake" and "Special Item" product categories

  Scenario: As an admin, I can add a product
    Given I am logged in as an admin
    And I visit the list of products
    Then I can add:
      |name    |picture       |description          |category     |is gluten free|is dairy free|is vegan|picture file       |
      |Macaroon|macaroon.jpg  |A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg       |
      |Muffin  |muffin.jpg    |A tasy muffin        |Special Item |Yes           |No           |No      |muffin.jpg         |

  Scenario: As an admin, I can edit a product
    Given these products:
      |name    |picture       |description          |category     |is gluten free|is dairy free|is vegan|picture file       |
      |Macaroon|macaroon.jpg  |A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg       |
      |Muffin  |muffin.jpg    |A tasy muffin        |Special Item |Yes           |No           |No      |muffin.jpg         |
    And I am logged in as an admin
    And I visit the list of products
    When I select to edit the "Macaroon"
    And change the name to "Delicious Macaroon"
    And change the picture to use "macaroon1.jpg"
    Then its name becomes "Delicious Macaroon"
    And its picture is updated to "macaroon1.jpg"
