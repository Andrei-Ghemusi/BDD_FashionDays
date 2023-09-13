from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager


class Browser:
    s = Service(ChromeDriverManager().install())
    chrome = webdriver.Chrome(service=s)
    chrome.implicitly_wait(5)
    chrome.set_page_load_timeout(5)
    chrome.maximize_window()
    chrome.delete_all_cookies()

    def close(self):
        self.chrome.delete_all_cookies()
        self.chrome.close()