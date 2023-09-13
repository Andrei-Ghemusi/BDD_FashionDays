from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
import time
from browser import Browser
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


class BasePage(Browser):
    COOKIES = '//*[@id="accept-cookie-policy"]'
    ACCOUNT = '//*[@id="customer-account"]/div[1]/i'
    CONTUL_MEU_TEXT_ELEMENT = '//*[text()="Contul Meu"]'

    def click_element(self, element):
        self.chrome.find_element(By.XPATH, element).click()

    def accept_cookies(self):
        self.click_element(self.COOKIES)

    def move_to_element(self, element):
        action_chains = ActionChains(self.chrome)
        action_chains.move_to_element(self.chrome.find_element(By.XPATH, element)).perform()

    def assert_text(self, text_element, expected_text: str):
        WebDriverWait(self.chrome, 5).until(EC.visibility_of_element_located((By.XPATH, text_element)))
        element = self.chrome.find_element(By.XPATH, text_element)
        actual_text: str = element.text
        assert expected_text in actual_text, f'ERROR, expected {expected_text}, but got {actual_text}'

    def assert_page_title(self, expected_title: str):
        actual_title: str = self.chrome.title
        assert expected_title in actual_title, f'ERROR, expected {expected_title} but got {actual_title}'

    def assert_url(self, expected_url: str):
        actual_url: str = self.chrome.current_url
        assert expected_url == actual_url, f'ERROR, expected url {expected_url}, but got {actual_url}'

    def assert_is_element_displayed(self, element):
        is_element_displayed: bool = self.chrome.find_element(By.XPATH, element).is_displayed()
        assert is_element_displayed, f"Element {element} is not displayed"

    def switch_window(self, page_index: int):
        page: str = self.chrome.window_handles[page_index]
        self.chrome.switch_to.window(page)

    def check_account_status(self):
        time.sleep(1)  # A small delay - neither implicit nor explicit wait would work here
        self.click_element(element=self.ACCOUNT)
        self.assert_url(expected_url='https://www.fashiondays.ro/customer/settings/')
        self.assert_text(text_element=self.CONTUL_MEU_TEXT_ELEMENT, expected_text='Contul Meu')

    def wait_for_element_visibility(self, element):
        return WebDriverWait(self.chrome, 10).until(EC.visibility_of_element_located((By.XPATH, element)))