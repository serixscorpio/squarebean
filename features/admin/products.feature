Feature: Admin Products
  Background:
    Given There are "Cake" and "Special Item" product categories
    And I am logged in as an admin

  @javascript
  Scenario: I can add a new product
    Given I visit the list of products
    Then I can add:
      |name    |description |category     |is gluten free|is dairy free|is vegan|unit quantity|price|picture file1|picture file2|picture file3|
      |Macaroon|A macaroon  |Special Item |Yes           |Yes          |Yes     |half dozen   |30   |macaroon.jpg |macaroon2.jpg|macaroon3.jpg|
      |Muffin  |tasty muffin|Special Item |Yes           |No           |No      |a dozen      |25   |muffin.jpg   |muffin.jpg   |muffin.jpg   |

  @javascript
  Scenario: I can edit an existing product
    Given these products:
      |name    |description          |category     |is gluten free|is dairy free|is vegan|unit quantity|price|featured picture|
      |Macaroon|A delicious macaroon |Special Item |Yes           |Yes          |Yes     |half dozen   |30   |macaroon.jpg    |
      |Muffin  |A tasty muffin       |Special Item |Yes           |No           |No      |a dozen      |25   |muffin.jpg      |
    And I visit the list of products
    When I select to edit the "Macaroon"
    And change the name to "Delicious Macaroon"
    And change the featured picture to use "macaroon1.jpg"
    And change the product price to "35"
    And change the unit quantity to "two dozens"
    Then its name becomes "Delicious Macaroon"
    And it shows product picture(s) "macaroon1.jpg"
    And its price becomes "35"
    And its unit quantity becomes "two dozens"

  @javascript
  Scenario: I can add more pictures to an existing product
    Given these products:
      |name    |description          |category     |is gluten free|is dairy free|is vegan|featured picture|
      |Macaroon|A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg    |
    And I visit the list of products
    When I select to edit the "Macaroon"
    And add a second picture "macaroon2.jpg" to the product
    Then it shows product picture(s) "macaroon.jpg, macaroon2.jpg"

  @javascript
  Scenario: I can remove a picture from an existing product
    Given these products:
      |name    |description          |category     |is gluten free|is dairy free|is vegan|featured picture|picture2      |
      |Macaroon|A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg    |macaroon2.jpg |
    And I visit the list of products
    When I select to edit the "Macaroon"
    And remove the second picture from the product
    Then it shows product picture(s) "macaroon.jpg"
    And it doesn't show product picture(s) "macaroon2.jpg"

  @javascript
  Scenario: I can change the display order of pictures within an existing product
    Given these products:
      |name    |description          |category     |is gluten free|is dairy free|is vegan|featured picture|picture2      |
      |Macaroon|A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg    |macaroon2.jpg |
    And I visit the list of products
    When I select to edit the "Macaroon"
    And swap the display order of the featured picture and the second picture
    Then product picture "macaroon2.jpg" shows before "macaroon.jpg"

  Scenario: I can delete an existing product
    Given these products:
      |name    |description          |category     |featured picture|
      |Macaroon|A delicious macaroon |Special Item |macaroon.jpg    |
      |Muffin  |A tasty muffin       |Special Item |muffin.jpg      |
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
      |name    |description          |category     |is gluten free|is dairy free|is vegan|featured picture|order|
      |Macaroon|A delicious macaroon |Special Item |Yes           |Yes          |Yes     |macaroon.jpg    |1    |
      |Muffin  |A tasty muffin       |Special Item |Yes           |No           |No      |muffin.jpg      |2    |
    And I visit the list of products
    When I change the order of product "Macaroon" to "3"
    Then the order of product "Macaroon" becomes "3"
