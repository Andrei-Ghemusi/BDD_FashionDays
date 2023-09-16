Feature: verify that the search functionality works correctly

 Background:
    Given I am on the fashion days website
    When I click on the search bar
    When I write in the search input the word "nike"


   @search @suggestion
   Scenario: verify that the after writing in the search bar, the suggestion we receive is correct
     Then I receive a suggestion that contains the searched word


  @search @products
  Scenario: verify that after searching a product, the first 5 products with that name will be displayed
    When I press enter
    Then I see the search results of the product written


  @search @price_filter
  Scenario: verify that when the price filter is set to 0, there are no products shown
    When I press enter
    When I set the price filter to zero
    Then There are no products shown and I see message "Nu au fost gasite produse."


  @search @delete_filters
  Scenario: verify that after clicking "delete all filters" all filters are deleted
    When I press enter
    When I choose the category slippers
    And I choose the category dresses
    When I click on delete filters button
    Then The filters have been removed and I see all the products

  @search @cart
  Scenario: test that products are added to and removed from the basket
    When I press enter
    When I click on the first product
    When I am on the product page and I click add to basket
    When I choose the size 40
    When I click on add to basket
    When I see message "Produsele au fost adaugate in cos."
    And I click on see basket
    When I am on the cart page
    And I click to remove the product
    Then I see message "Cosul tau e gol acum, hai sa il umpli cu tot ce vrei sa porti maine!" and the cart is empty


