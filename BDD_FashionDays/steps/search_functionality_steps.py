from behave import *
from selenium.common import NoSuchElementException


@given('I am on the fashion days website')
def step_impl(context):
    context.main_page.navigate_to_main_page()

@given('I accept cookies')
def step_impl(context):
    try:
        context.base_page.accept_cookies()
    except NoSuchElementException:
        pass

@when('I click on the search bar')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="mobile-search"]/span')

@when('I write in the search input the word "nike"')
def step_impl(context):
    context.search_functionality_page.send_input_into_search(word='nike')

@then('I receive a suggestion that contains the searched word')
def step_impl(context):
    context.search_functionality_page.verify_suggestions(word="nike")

@when('I press enter')
def step_impl(context):
    context.search_functionality_page.press_enter()

@then('I see the search results of the product written')
def step_impl(context):
    context.search_functionality_page.verify_search_results(word='nike')

@when('I set the price filter to zero')
def step_impl(context):
    context.search_functionality_page.set_price_filter_to_zero()

@then('There are no products shown and I see message "Nu au fost gasite produse."')
def step_impl(context):
    context.base_page.assert_is_element_displayed(element='//*[@id="products-listing-list"]/div/h2')
    context.base_page.assert_text(text_element='//*[@id="products-listing-list"]/div/h2', expected_text='Nu au fost gasite produse.')

@when('I choose the category slippers')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="categoryOpt_350__SLIPPERS__11__FOOTWEAR"]/a')

@when('I choose the category dresses')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="categoryOpt_19__DRESSES__4__CLOTHING"]/a')


@when('I click on delete filters button')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="categoryFilterOptions"]/a')


@then('The filters have been removed and I see all the products')
def step_impl(context):
    context.search_functionality_page.check_filters()

@when('I click on the first product')
def step_impl(context):
    context.base_page.click_element(element='//h2[@class="product-card-brand"]')

@when('I am on the product page and I click add to basket')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="buy-box"]/span')

@when('I choose the size 40')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="pdp-size-select-modal"]/div[2]/ul/li[1]/div/div[1]/div/span')

@when('I see message "Produsele au fost adaugate in cos."')
def step_impl(context):
    context.base_page.assert_is_element_displayed(element='//*[@id="basket-notification"]/span')
    context.base_page.assert_text(text_element='//*[@id="basket-notification"]/span',
                                  expected_text='Produsele au fost adaugate in cos.')

@when('I click on see basket')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="customer-basket"]/div[1]/i')

@when('I am on the cart page')
def step_impl(context):
    context.base_page.assert_url(expected_url='https://www.fashiondays.ro/cart/')

@when('I click to remove the product')
def step_impl(context):
    context.base_page.click_element(element='//*[@id="group-list-availability_id_3"]/div/div[2]/div[3]/div[1]/div[2]/a')

@then('I see message "Cosul tau e gol acum, hai sa il umpli cu tot ce vrei sa porti maine!" and the cart is empty')
def step_impl(context):
    context.base_page.assert_is_element_displayed(element='//*[@id="full-site-canvas"]/div[3]/div/div[4]/div/div/h3')
    context.base_page.assert_text(text_element='//*[@id="full-site-canvas"]/div[3]/div/div[4]/div/div/h3',
                                  expected_text='Cosul tau e gol acum, hai sa il umpli cu tot ce vrei sa porti maine!')


