Feature: check the social media links

  Background:
    Given Main Page: I am on the fashion days website



      @main_page @social_media
      Scenario Outline: check that the social media links are not broken and work correctly
        When Main Page: I accept the cookies
        When I click on the social media link with the name "<link_text>" and element "<element_xpath>"
        When I switch to the newly opened tab
        Then I should be redirected to the page with title "<expected_title>"
        And the URL should be "<expected_url>"
        Then I close the page
        Then I return to the original page
        Examples:
        | link_text   | element_xpath                                                           | expected_title                                              | expected_url                                       |
        | Facebook    | //*[@id="footer"]/div[1]/div/div/div[3]/div[2]/div[2]/div[1]/ul/li[1]/a | Fashion Days \| Bucharest                                   | https://www.facebook.com/fashiondays.romania/      |
        | Pinterest   | //*[@id="footer"]/div[1]/div/div/div[3]/div[2]/div[2]/div[1]/ul/li[5]/a | Fashion Days Romania (FashionDaysRO) - Profile \| Pinterest | https://ro.pinterest.com/FashionDaysRO/            |
        | TikTok      | //*[@id="footer"]/div[1]/div/div/div[3]/div[2]/div[2]/div[1]/ul/li[3]/a | Fashion Days (@fashiondaysromania) Official \| TikTok       | https://www.tiktok.com/@fashiondaysromania?lang=en |
