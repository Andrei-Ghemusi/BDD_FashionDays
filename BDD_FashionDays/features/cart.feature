Feature: simulate buying a product


    @cart
    Scenario: test that products are added to and removed from the basket
      Given I am on the fashion days website
      When I click on the search bar
      When I write in the search input the word "nike"
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