Feature: check the functionalities of the fashion days website main page

  Background:
    Given Main Page: I am on the fashion days website
    And Main Page: I accept the cookies


    @main_page @clicks
    Scenario Outline: Verify that after clicking on certain elements you are being redirected to the correct page
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


      @main_page @social_media
      Scenario Outline: check that the social media links are not broken and work correctly
        When I click on the social media link with the name "<link_text>" and element "<element_xpath>"
        When I switch to the newly opened tab
        Then I should be redirected to the page with title "<expected_title>"
        And the URL should be "<expected_url>"
        Examples:
        | link_text   | element_xpath                                                           | expected_title                                            | expected_url                                       |
        | Facebook    | //*[@id="footer"]/div[1]/div/div/div[3]/div[2]/div[2]/div[1]/ul/li[1]/a | Fashion Days \| Bucharest                                 | https://www.facebook.com/fashiondays.romania/      |
        | Instagram   | //*[@id="footer"]/div[1]/div/div/div[3]/div[2]/div[2]/div[1]/ul/li[2]/a | Fashion Days (@fashiondays) Instagram photos and videos   | https://www.instagram.com/fashiondays/?hl=en       |
        | TikTok      | //*[@id="footer"]/div[1]/div/div/div[3]/div[2]/div[2]/div[1]/ul/li[3]/a | Fashion Days (@fashiondaysromania) Official \| TikTok     | https://www.tiktok.com/@fashiondaysromania?lang=en |


      @main_page @newsletter @negative_tests
      Scenario Outline: check that we cannot subscribe to the newsletter using no email or providing invalid ones
        When I move to newsletter
        When I insert the email "<email>"
        When I "<checkbox_status>" the age checkbox
        When I click on the submit button with text "<submit_button_text>" and element "<submit_button_element>"
        Then I cannot subscribe to the newsletter and receive an error with the text "<error_text>" and element "<error_element>"
        Examples:
        | email                        | submit_button_text      | submit_button_element      | checkbox_status     | error_text                                        | error_element                                                      |
        | N/A                          | OFERTE PENTRU FEMEI     | //*[@id="form_saveWomen"]  | disabled            | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | N/A                          | OFERTE PENTRU BARBATI   | //*[@id="form_saveMen"]    | disabled            | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | N/A                          | OFERTE PENTRU FEMEI     | //*[@id="form_saveWomen"]  | enabled             | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | N/A                          | OFERTE PENTRU BARBATI   | //*[@id="form_saveMen"]    | enabled             | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | wrong_email                  | OFERTE PENTRU FEMEI     | //*[@id="form_saveWomen"]  | disabled            | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | wrong_email                  | OFERTE PENTRU FEMEI     | //*[@id="form_saveWomen"]  | enabled             | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | wrong_email                  | OFERTE PENTRU BARBATI   | //*[@id="form_saveMen"]    | disabled            | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | wrong_email                  | OFERTE PENTRU BARBATI   | //*[@id="form_saveMen"]    | enabled             | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | 73gdg%%@#%                   | OFERTE PENTRU FEMEI     | //*[@id="form_saveWomen"]  | disabled            | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | 73gdg%%@#%                   | OFERTE PENTRU FEMEI     | //*[@id="form_saveWomen"]  | enabled             | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | 73gdg%%@#%                   | OFERTE PENTRU BARBATI   | //*[@id="form_saveMen"]    | disabled            | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | 73gdg%%@#%                   | OFERTE PENTRU BARBATI   | //*[@id="form_saveMen"]    | enabled             | Te rugam sa introduci o adresa de email valida.   | //*[@id="newsletter-form"]/div[1]/span/div[2]/span[2]              |
        | pythontestemail083@gmail.com | OFERTE PENTRU FEMEI     | //*[@id="form_saveWomen"]  | disabled            | Trebuie sa ai cel putin 16 ani pentru a te abona. | //*[@id="newsletter-form"]/div[2]/div[1]/div/div[1]/div[2]/span[2] |
        | pythontestemail083@gmail.com | OFERTE PENTRU BARBATI   | //*[@id="form_saveMen"]    | disabled            | Trebuie sa ai cel putin 16 ani pentru a te abona. | //*[@id="newsletter-form"]/div[2]/div[1]/div/div[1]/div[2]/span[2] |


      @main_page @newsletter @positive_tests
      Scenario Outline: check that after providing correct emails, when trying to subscribe the captcha appears
        When I move to newsletter
        When I insert the email "<email>"
        When I "<checkbox_status>" the age checkbox
        When I click on the submit button with text "<submit_button_text>" and element "<submit_button_element>"
        Then I see the captcha being displayed
        Examples:
        | email                        | submit_button_text      | submit_button_element      | checkbox_status     |
        | pythontestemail083@gmail.com | OFERTE PENTRU FEMEI     | //*[@id="form_saveWomen"]  | enabled             |
        | pythontestemail083@gmail.com | OFERTE PENTRU BARBATI   | //*[@id="form_saveMen"]    | enabled             |


