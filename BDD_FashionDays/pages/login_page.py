
from selenium.webdriver.common.by import By
from pages.base_page import BasePage


class LoginPage(BasePage):
    EMAIL_BOX = (By.XPATH, '//*[@id="email"]')
    PASSWORD_BOX = (By.XPATH, '//*[@id="password"]')
    FACEBOOK_LOGIN_BUTTON = '//*[@id="login"]/div[4]/div[2]/button/div/span[2]'
    FACEBOOK_COOKIES = '//button[text()="Allow all cookies"]'
    FACEBOOK_EMAIL = '//*[@id="email"]'
    FACEBOOK_PASSWORD = '//*[@id="pass"]'
    FACEBOOK_POP_UP_LOGIN = '//*[@id="loginbutton"]'


    # this method inserts the email
    def insert_email(self, email):
        self.chrome.find_element(*self.EMAIL_BOX).send_keys(email)

    # this method adds the password
    def insert_password(self, password):
        self.chrome.find_element(*self.PASSWORD_BOX).send_keys(password)

    # this method switches to the facebook pop up
    def switch_to_facebook(self):
        all_handles = self.chrome.window_handles
        popup_window_handle = all_handles[-1]
        self.chrome.switch_to.window(popup_window_handle)

    # we switch back to the original login window
    def switch_back(self):
        all_handles = self.chrome.window_handles
        main_handle = all_handles[0]
        self.chrome.switch_to.window(main_handle)






