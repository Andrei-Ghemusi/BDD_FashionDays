Feature: verify the product filters
  Background:
    Given I am on the fashion days website
    When I click on the search bar
    When I write in the search input the word "nike"
    When I press enter


    @filters
    Scenario: verify that when the price filter is set to 0, there are no products shown
      When I set the price filter to zero
      Then There are no products shown and I see message "Nu au fost gasite produse."


    @filters
    Scenario: verify that after clicking "delete all filters" all filters are deleted
      When I choose the category slippers
      And I choose the category dresses
      When I click on delete filters button
      Then The filters have been removed and I see all the products