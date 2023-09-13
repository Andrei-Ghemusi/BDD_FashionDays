from browser import Browser
from pages.base_page import BasePage
from pages.login_page import LoginPage
from pages.main_page import MainPage
from pages.search_functionality_page import SearchFunctionality


def before_all(context):
    context.browser = Browser()
    context.base_page = BasePage()
    context.main_page = MainPage()
    context.login_page = LoginPage()
    context.search_functionality_page = SearchFunctionality()


def after_all(context):
    context.browser.close()