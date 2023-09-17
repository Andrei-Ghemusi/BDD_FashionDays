# Testing FashionDays using behave in python

## Introduction
This project focuses on conducting functional tests for the FashionDays website using Behave with Python. If you are interested in non-functional tests, please refer to this repository.

## Purpose
The primary objective of this project is to ensure the quality and reliability of the FashionDays website through a variety of tests, including Smoke Testing, Sanity Testing, and Regression Testing. The goal is to identify and address ERRORS, BUGS, and FAILURES while providing recommendations for enhancements.

## Project Structure
The project is organized as follows:

- "features" package which contains the following feature files:
  - "cart.feature" : Simulates the process of purchasing a product;
  - "login.feature" : Validates functionalities of the authentication page;
  - "main_page.feature" : Examines functionalities on the Fashion Days website's main page;
  - "newsletter.feature" : Ensures the newsletter functionality operates correctly;
  - "product_filters.feature" : Verifies the correctness of product filtering;
  - "search_functionality.feature" : Checks that the search functionality works correctly;
  - "social_media.feature" : Checks the social media links are not broken.

 - "pages" package which contains the following .py files:
   - "base_page" : contains methods used throughout the entire project, especially in the "steps" files;
   - "login_page" : contains methods used for the login/authentication_page;
   - "main_page" : contains methods used for the main page tests;
   - "search_functionality_page" : contains methods used for testing the search functionality.
  
   - "steps" package which contains the following .py files:
     - "login_steps" : contains the steps that each test on the authentication page follows;
     - "main_page_steps" : contains the steps that each test on the main page follows;
     - "search_functionality_steps" : contains the steps that each test regarding the search functionality follows.

- additional files:
  - "behave-report.html" : This HTML report is generated when running the tests.;
  - behave.ini :  Contains configuration for the HTML formatter;
  - "browser.py" : Sets up the browser for testing;
  - "environment.py" : Instantiates objects from the classes to be used throughout the project.

## Libraries used
- behave;
- selenium;
- time;
- webdriver_manager;
- HtmlTestRunner (*If not installable via pip, search for 'html-testRunner' in Python packages*).

## Installation
To install the required libraries, execute the following commands::
- `pip install selenium`
- `pip install pytest`
- `pip install behave`
- `pip install webdriver_manager`
- `pip install html-testRunner`

If you encounter compatibility issues, you can try upgrading the libraries:
- `pip install selenium --upgrade`
- `pip install pytest --upgrade`
- `pip install behave --upgrade`
- `pip install webdriver_manager --upgrade`
- `pip install html-testRunner --upgrade`

## Running the Project
- to run the desired tests use the following command "behave -f html -o behave-report.html --tags=your_tag" , be sure to replace the "your_tag" with the desired test tag;
- For running the entire project, use: "behave -f html -o behave-report.html". Note that running the entire project at once may lead to some functionalities, such as the newsletter, becoming unreachable due to the website's built-in security. Refer to the "Known Issues" section for details.

## Known Issues and Recommendations
- Address the price filter issue for improved accuracy. Currently, setting the drag and drop to the very end results in a filter value of 0 in the code, although it may not reflect visually. Additionally, Selenium's fast actions while setting the drag and drop to 0 can lead to the visual price remaining at the maximum;
- Tests related to "social_media.feature" and "newsletter.feature" may not always work when running the entire project but can be successful when executed separately;
- ests from the "cart.feature" may not function correctly if the product size is out of stock.








