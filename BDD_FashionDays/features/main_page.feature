Feature: check the functionalities of the fashion days website main page

  Background:
    Given Main Page: I am on the fashion days website


    @main_page @clicks
    Scenario Outline: Verify that after clicking on certain elements you are being redirected to the correct page
      When Main Page: I accept the cookies
      When Main Page: I click on the link with text "<link_text>" identified by XPath "<element_xpath>"
      Then I should be redirected to the page with title "<expected_title>"
      And the URL should be "<expected_url>"
      Examples:
      | link_text   | element_xpath                                                           | expected_title                                            | expected_url                                  |
      | BARBATI     | //a[text() = "Barbati"]                                                 | Colectii de moda pentru barbati                           | https://www.fashiondays.ro/t/barbati/         |
      | FEMEI       | //a[text() = "Femei"]                                                   | Colectii de moda pentru femei                             | https://www.fashiondays.ro/                   |
      | FETE        | //a[text() = "Fete"]                                                    | Destinatia de fashion #1 in Europa Centrala si de Est     | https://www.fashiondays.ro/t/fete/            |
      | BAIETI      | //a[text() = "Baieti"]                                                  | Destinatia de fashion #1 in Europa Centrala si de Est     | https://www.fashiondays.ro/t/baieti/          |


    @main_page @hovers
    Scenario Outline: Hover over elements and navigate to their subsidiaries
      When I hover over "<element_name>" with element "<element_xpath>"
      When I click on "<subsidiary_name>" with element "<subsidiary_element>"
      Then I should be redirected to the page with title "<expected_title>"
      And the URL should be "<expected_url>"
      Examples:
      | element_name | element_xpath                                    | subsidiary_name      | subsidiary_element                                                  | expected_title           | expected_url                                                                         |
      | Imbracaminte | //*[@id="main-menu"]/div[2]/nav[1]/ul/li[2]/span | Rochii               | //*[@id="main-menu"]/div[2]/nav[1]/ul/li[2]/div/div[2]/a[2]/span[1] | Rochii Dama              | https://www.fashiondays.ro/g/femei-/imbracaminte-rochii                              |
      | Incaltaminte | //*[@id="main-menu"]/div[2]/nav[1]/ul/li[3]/span | Mocasini si balerini | //*[@id="main-menu"]/div[2]/nav[1]/ul/li[3]/div/div[2]/a[3]/span[1] | Mocasini Dama            | https://www.fashiondays.ro/g/femei-/incaltaminte-balerini+mocasini                   |
      | Outlet       | //*[@id="main-menu"]/div[2]/nav[1]/ul/li[8]/span | Articole sub 50 lei  | //*[@id="main-menu"]/div[2]/nav[1]/ul/li[8]/div/div[2]/a[15]/span   | Articole sub 50 lei      | https://www.fashiondays.ro/s/under-15-euro-menu-mmse-w                               |
      | Sport        | //*[@id="main-menu"]/div[2]/nav[1]/ul/li[5]/span | Pantofi sport        | //*[@id="main-menu"]/div[2]/nav[1]/ul/li[5]/div/div[2]/a[1]/span    | Pantofi sport si tenisi  | https://www.fashiondays.ro/s/all-sport-menu-w/-/incaltaminte-pantofi_sport_si_tenisi |