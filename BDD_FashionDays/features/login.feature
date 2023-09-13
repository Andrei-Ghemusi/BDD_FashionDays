Feature: check the functionalities of the authentication page

  Background:
    Given I am on the authentication page
    And I accept the cookies


    @authentication_page @buttons_display
    Scenario Outline: verify that certain login buttons are displayed
      Then the button for "<button_name>" with element "<button_element>" is displayed
      Examples:
      | button_name                   | button_element                                            |
      | Conecteaza-te cu eMAG         | //*[@id="login"]/div[4]/div[1]/button/div/span[2]         |
      | Facebook                      | //*[@id="login"]/div[4]/div[2]/button/div/span[2]         |
      | Intra in cont cu Google       | //*[@id="login"]/div[4]/div[3]/button                     |
      | Apple                         | //*[@id="login"]/div[4]/div[4]/button                     |


    @authentication_page @negative_testing
    Scenario Outline: verify that after providing missing or incorrect credentials we cannot log in
      When I insert an "<email>" into the email box
      When I insert a "<password>" into the password box
      When I click on the login button
      Then I receive an "<error_text>" with element "<error_element>" and cannot log in
      Examples:
      | email                        | password      | error_text                                                                          | error_element                   |
      | N/A                          | N/A           | Acest camp este obligatoriu                                                         | //*[@id="loginform"]/div[2]/div |
      | N/A                          | password      | Acest camp este obligatoriu                                                         | //*[@id="loginform"]/div[1]/div |
      | email                        | N/A           | Acest camp este obligatoriu                                                         | //*[@id="loginform"]/div[2]/div |
      | 3424%$#$#%@                  | password      | Adresa de email este invalida.                                                      | //*[@id="loginform"]/div[1]/div |
      | pythontestemail083@gmail.com | password      | Adresa de email sau parola este incorecta. Te rugam sa introduci o alta combinatie. | //*[@id="loginform"]/div[1]/div |


      @authentication_page @positive_testing @login_correct
      Scenario Outline: verify that after providing correct credentials we can log in
        When I insert an "<email>" into the email box
        When I insert a "<password>" into the password box
        When I click on the login button
        Then I am successfully logged in and I check the account status
        Examples:
        | email                        | password      |
        | pythontestemail083@gmail.com | TestEmail123  |


      @authentication_page @logout
      Scenario: while logged in, check that after logging out, the state change from "logged in" to "logged out"
        When I move to account and click on the logout button
        When I click on account
        Then I am logged out and I am redirected on the authentication page


      @authentication_page @facebook_login
      Scenario: verify that you can login using facebook
        When I click on the facebook login button
        When I switch to the popup window
        When I accept Facebook cookies
        When I insert an email and a password
        When I click the login button from the pop up
        When I wait for the application to login
        When I switch back to the main_page window
        Then I am successfully logged in and I check the account status









