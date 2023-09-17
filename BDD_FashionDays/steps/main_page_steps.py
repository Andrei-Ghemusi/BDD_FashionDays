from behave import *
from selenium.common import NoSuchElementException


@given('Main Page: I am on the fashion days website')
def step_impl(context):
    context.base_page.navigate_to_page("https://www.fashiondays.ro/")

@when('Main Page: I accept the cookies')
def step_impl(context):
    try:
        context.base_page.accept_cookies()
    except NoSuchElementException:
        pass

@when('Main Page: I click on the link with text "{link_text}" identified by XPath "{element_xpath}"')
def step_impl(context, link_text, element_xpath):
    context.base_page.assert_text(element_xpath, link_text)
    context.base_page.click_element(element_xpath)

@then('I should be redirected to the page with title "{expected_title}"')
def step_impl(context, expected_title):
    context.base_page.assert_page_title(expected_title)

@then('the URL should be "{expected_url}"')
def step_impl(context, expected_url):
    context.base_page.assert_url(expected_url)

@when('I hover over "{element_name}" with element "{element_xpath}"')
def step_impl(context, element_xpath, element_name):
    context.base_page.assert_text(element_xpath, element_name)
    context.base_page.move_to_element(element_xpath)

@when('I click on "{subsidiary_name}" with element "{subsidiary_element}"')
def step_impl(context, subsidiary_element, subsidiary_name):
    context.base_page.assert_text(subsidiary_element, subsidiary_name)
    context.base_page.click_element(subsidiary_element)

@when('I move to newsletter')
def step_impl(context):
    context.base_page.move_to_element(element='//*[@id="footer"]/div[1]/div/div/div[3]/div[1]/div[2]/div/ul/li[2]/a')
    context.base_page.wait_for_element_visibility(element='//*[@id="form_saveWomen"]')

@when('I insert the email "{email}"')
def step_impl(context, email):
    if email != "N/A":
        context.main_page.insert_email(email)

@when('I "{checkbox_status}" the age checkbox')
def step_impl(context, checkbox_status):
    if checkbox_status != "disabled":
        context.main_page.enable_age_checkbox()

@when('I click on the submit button with text "{submit_button_text}" and element "{submit_button_element}"')
def step_impl(context, submit_button_element, submit_button_text):
    context.base_page.assert_text(submit_button_element, submit_button_text)
    context.base_page.click_element(submit_button_element)

@then('I cannot subscribe to the newsletter and receive an error with the text "{error_text}" and element "{error_element}"')
def step_impl(context, error_element, error_text):
    context.base_page.assert_text(error_element, error_text)

@then('I see the captcha being displayed')
def step_impl(context):
    context.main_page.is_captcha_displayed()

@when('I switch to the newly opened tab')
def step_impl(context):
    context.base_page.switch_window(1)

@when('I click on the social media link with the name "{link_text}" and element "{element_xpath}"')
def step_impl(context, element_xpath, link_text):
    context.base_page.assert_text(element_xpath, link_text)
    context.base_page.click_element(element_xpath)

@then('I close the page')
def step_impl(context):
    context.base_page.close_current_page()

@then('I return to the original page')
def step_impl(context):
    context.base_page.switch_window(0)