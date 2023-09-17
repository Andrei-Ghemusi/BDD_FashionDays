Feature: check that the newsletter functionality works fine

  Background:
    Given Main Page: I am on the fashion days website
    When Main Page: I accept the cookies


      @newsletter @negative_tests
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


      @newsletter @positive_tests
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