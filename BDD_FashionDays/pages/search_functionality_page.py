from selenium.webdriver import Keys, ActionChains
from selenium.webdriver.common.by import By
from pages.base_page import BasePage


class SearchFunctionality(BasePage):
    SEARCH_BAR = '//*[@id="mobile-search"]/span'
    SEARCH_INPUT = '//*[@id="search-input"]'
    SUGGESTION = '//*[@id="search-container__results"]/li[1]'
    RESULTS = '//h2[@class="product-card-brand"]'
    FIRST_HANDLE = '//*[@id="slider-range"]/span[1]'
    SECOND_HANDLE = '//*[@id="slider-range"]/span[2]'
    SLIPPERS = '//*[@id="categoryOpt_350__SLIPPERS__11__FOOTWEAR"]/a'
    DRESSES = '//*[@id="categoryOpt_19__DRESSES__4__CLOTHING"]/a'

    # this method checks that the suggestions have the desired word in them
    def verify_suggestions(self, word):
        BasePage.assert_text(self, self.SUGGESTION, word)

    # this methods presses enter
    def press_enter(self):
        self.chrome.find_element(By.XPATH, self.SEARCH_INPUT).send_keys(Keys.ENTER)

    # this method checks that the search results contain our searched word/product
    def verify_search_results(self, word):
        results_list = self.chrome.find_elements(By.XPATH, self.RESULTS)
        # here we made a list of the products shown after the search using the class they all use so that we can iterate through them and see if the text is as expected
        for i in range(5):
            # we use the range of 5 as I feel it is enough for the test
            results = results_list[i].text.lower()
            # we use lowercase as to avoid random uppercases or lowercases
            expected_text = word
            assert expected_text in results, f'Error, {expected_text} does not appear in {results} at product number {i}'
            # in case the name of the product is not the expected one this assertion points where the issue is

    # this method sets the price filter to 0
    def set_price_filter_to_zero(self):
        actions = ActionChains(self.chrome)
        first_handle = self.chrome.find_element(By.XPATH, self.FIRST_HANDLE)
        second_handle = self.chrome.find_element(By.XPATH, self.SECOND_HANDLE)
        actions.drag_and_drop(second_handle, first_handle).perform()
        # we use action chains here to drag and drop the second handle

    # this method checks that the filters are no longer active
    def check_filters(self):
        filter1 = BasePage.wait_for_element_visibility(self, element=self.SLIPPERS)
        filter2 = BasePage.wait_for_element_visibility(self, element=self.DRESSES)
        assert "active-filter" not in filter1.get_attribute('class')
        assert "active-filter" not in filter2.get_attribute('class')


