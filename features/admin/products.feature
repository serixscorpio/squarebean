Feature: Admin Products
  Background:
    Given There are "Cake" and "Special Item" product categories
    And I am logged in as an admin

  @javascript
  Scenario: I can add a new product
    Given I visit the list of products
    Then I can add:
      |name    |description |category     |is gluten free|is dairy free|is vegan|picture file1|picture file2|picture file3|
      |Macaroon|A macaroon  |Special Item |Yes           |Yes          |Yes     |macaroon.jpg |macaroon2.jpg|macaroon3.jpg|
      |Muffin  |tasty muffin|Special Item |Yes           |No           |No      |muffin.jpg   |muffin2.jpg  |muffin3.jpg  |

  @javascript
  Scenario: I can edit an existing product
    Given these products:
      |name    |picture       |description          |category     |is gluten free|is dairy free|is vegan|picture file       |
      |Macaroon|macaroon.jpg  |A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg       |
      |Muffin  |muffin.jpg    |A tasty muffin       |Special Item |Yes           |No           |No      |muffin.jpg         |
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

  Scenario: The default admin page shows the list of products and links to other admin pages
    When I visit the default admin page
    Then I see the list of products
    And I see links to admin Product page, Event page, and FAQ page

  Scenario: I can change the ordering of existing products
    Given these products:
      |name    |picture       |description          |category     |is gluten free|is dairy free|is vegan|picture file|order|
      |Macaroon|macaroon.jpg  |A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg|1    |
      |Muffin  |muffin.jpg    |A tasy muffin        |Special Item |Yes           |No           |No      |muffin.jpg  |2    |
    And I visit the list of products
    When I change the order of product "Macaroon" to "3"
    Then the order of product "Macaroon" becomes "3"
