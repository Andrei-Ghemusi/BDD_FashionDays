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


