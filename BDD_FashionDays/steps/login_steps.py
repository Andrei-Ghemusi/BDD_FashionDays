from behave import *
from selenium.common import NoSuchElementException


@given('I am on the authentication page')
def step_impl(context):
    context.login_page.navigate_to_login_page()

@given('I accept the cookies')
def step_impl(context):
    try:
        context.base_page.accept_cookies()
    except NoSuchElementException:
        pass

@then('the button for "{button_name}" with element "{button_element}" is displayed')
def step_impl(context, button_element, button_name):
    context.base_page.assert_is_element_displayed(button_element)
    context.base_page.assert_text(button_element, button_name)

@when('I insert an "{email}" into the email box')
def step_impl(context, email):
    if email != "N/A":
        context.login_page.insert_email(email)

@when('I insert a "{password}" into the password box')
def step_impl(context, password):
    if password != 'N/A':
        context.login_page.insert_password(password)

@when('I click on the login button')
def step_impl(context):
    context.login_page.click_login_button()

@then('I receive an "{error_text}" with element "{error_element}" and cannot log in')
def step_impl(context, error_text, error_element):
    context.base_page.assert_text(error_element, error_text)

@then('I am successfully logged in and I check the account status')
def step_impl(context):
    context.login_page.check_account_status()

@when('I click on the facebook login button "{facebook_login_button}"')
def step_impl(context, facebook_login_button):
    context.base_page.click_element(facebook_login_button)

@when('I switch to the popup window')
def step_impl(context):
    context.login_page.switch_to_facebook()

@when('I accept Facebook cookies "{facebook_cookies}"')
def step_impl(context, facebook_cookies):
    context.base_page.click_element(facebook_cookies)

@when('I insert an email and a password')
def step_impl(context):
    context.login_page.insert_facebook_email()
    context.login_page.insert_facebook_password()

@when('I click the login button from the pop up "{pop_up_login}"')
def step_impl(context, pop_up_login):
    context.base_page.click_element(pop_up_login)

@when('I switch back to the main_page window')
def step_impl(context):
    context.login_page.switch_back()

@when('I move to "{account_element}" and click on the logout "{logout_button}"')
def step_impl(context, account_element, logout_button):
    context.base_page.move_to_element(account_element)
    context.base_page.click_element(logout_button)







