import time

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

@when('I click on the facebook login button')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="login"]/div[4]/div[2]/button/div/span[2]')

@when('I switch to the popup window')
def step_impl(context):
    context.login_page.switch_to_facebook()

@when('I accept Facebook cookies')
def step_impl(context):
    context.base_page.click_element(element='//button[text()="Allow all cookies"]')

@when('I insert an email and a password')
def step_impl(context):
    context.login_page.insert_facebook_email()
    context.login_page.insert_facebook_password()

@when('I click the login button from the pop up')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="loginbutton"]')

@when('I switch back to the main_page window')
def step_impl(context):
    context.login_page.switch_back()

@when('I move to account and click on the logout button')
def step_impl(context):
    context.base_page.move_to_element(element='//*[@id="customer-account"]/div[1]/i')
    context.base_page.click_element(element='//*[text()="Logout"]')

@when('I click on account')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="customer-account"]/div[1]/i')

@then('I am logged out and I am redirected on the authentication page')
def step_impl(context):
    context.base_page.assert_url(expected_url='https://www.fashiondays.ro/customer/authentication')

@when('I wait for the application to login')
def step_impl(context):
    context.base_page.wait_with_sleep(seconds=5)