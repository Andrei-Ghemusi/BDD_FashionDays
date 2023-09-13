from selenium.webdriver.common.by import By
from pages.base_page import BasePage


class LoginPage(BasePage):
    EMAIL_BOX = (By.XPATH, '//*[@id="email"]')
    PASSWORD_BOX = (By.XPATH, '//*[@id="password"]')
    LOGIN_BUTTON = '//*[@id="pizokel_customer_submit"]'
    FACEBOOK_LOGIN_BUTTON = '//*[@id="login"]/div[4]/div[2]/button/div/span[2]'
    FACEBOOK_COOKIES = '//button[text()="Allow all cookies"]'
    FACEBOOK_EMAIL = '//*[@id="email"]'
    FACEBOOK_PASSWORD = '//*[@id="pass"]'
    FACEBOOK_POP_UP_LOGIN = '//*[@id="loginbutton"]'

    def navigate_to_login_page(self):
        self.chrome.get('https://www.fashiondays.ro/customer/authentication')

    def insert_email(self, email):
        self.chrome.find_element(*self.EMAIL_BOX).send_keys(email)

    def insert_password(self, password):
        self.chrome.find_element(*self.PASSWORD_BOX).send_keys(password)

    def click_login_button(self):
        BasePage.click_element(self, self.LOGIN_BUTTON)

    def switch_to_facebook(self):
        all_handles = self.chrome.window_handles
        popup_window_handle = all_handles[-1]
        self.chrome.switch_to.window(popup_window_handle)

    def insert_facebook_email(self):
        self.chrome.find_element(By.XPATH, self.FACEBOOK_EMAIL).send_keys('pythontestemail083@gmail.com')

    def insert_facebook_password(self):
        self.chrome.find_element(By.XPATH, self.FACEBOOK_PASSWORD).send_keys('TestEmail123')

    def switch_back(self):
        all_handles = self.chrome.window_handles
        main_handle = all_handles[0]
        self.chrome.switch_to.window(main_handle)






