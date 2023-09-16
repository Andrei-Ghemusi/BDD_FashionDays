from selenium.webdriver.common.by import By
from pages.base_page import BasePage


class MainPage(BasePage):
    CHECKBOX = '//*[@id="newsletter-form"]/div[2]/div[1]/div/div[2]/label/span'
    CAPTCHA = '//div[@class="g-recaptcha"]'
    EMAIL_BOX = (By.XPATH, '//*[@id="form_email"]')

    # this method inserts the email into the email box
    def insert_email(self, email):
        self.chrome.find_element(*self.EMAIL_BOX).send_keys(email)

    # this method enables the checkbox
    def enable_age_checkbox(self):
        self.click_element(self.CHECKBOX)

    # this method asserts that the captcha is displayed
    def is_captcha_displayed(self):
        self.assert_is_element_displayed(self.CAPTCHA)