from selenium.webdriver.common.by import By
from pages.base_page import BasePage
from selenium.webdriver.common.keys import Keys
from time import sleep

class MainPage(BasePage):
    NEWSLETTER = '//*[@id="form_saveWomen"]'
    CHECKBOX = '//*[@id="newsletter-form"]/div[2]/div[1]/div/div[2]/label/span'
    CAPTCHA = '//div[@class="g-recaptcha"]'
    EMAIL_BOX = (By.XPATH, '//*[@id="form_email"]')

    def navigate_to_main_page(self):
        self.chrome.get("https://www.fashiondays.ro/")

    def move_to_newsletter(self):
        self.move_to_element(self.NEWSLETTER)

    def insert_email(self, email):
        self.chrome.find_element(*self.EMAIL_BOX).send_keys(email)

    def enable_age_checkbox(self):
        self.click_element(self.CHECKBOX)

    def is_captcha_displayed(self):
        self.assert_is_element_displayed(self.CAPTCHA)