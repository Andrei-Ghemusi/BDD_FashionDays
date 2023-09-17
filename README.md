# Testing FashionDays using behave in python

## Introduction
In this project, I will be running functional tests on on the FashionDays website using behave with python, if you are interested in seeing non-functional tests go here https://github.com/Andrei-Ghemusi/unittest_project_FashionDays

## Purpose
The primary purpose of this project is to conduct a wide range of tests to ensure the robustness and quality of the FashionDays website. These tests include functional tests such as Smoke Testing, Sanity Testing, and Regression Testing. The goal is to identify and address ERRORS, BUGS, FAILURES, and provide recommendations for improvements.

## Project Structure
The project is structured as follows:

- "features" package which contains the following feature files:
  - "cart.feature" : simulates buying a product;
  - "login.feature" : checks certain functionalities of the authentication page;
  - "main_page.feature" : checks certain functionalities of the fashion days website main page;
  - "newsletter.feature" : checks that the newsletter functionality works correctly;
  - "product_filters.feature" : checks that the product filters work correctly;
  - "search_functionality.feature" : checks that the search functionality works correctly;
  - "social_media.feature" : checks the social media links are not broken.

 - "pages" package which contains the following .py files:
   - "base_page" : contains methods used throughout the entire project, especially in the "steps" files;
   - "login_page" : contains methods used for the login/authentication_page;
   - "main_page" : contains methods used for the main page tests;
   - "search_functionality_page" : contains methods used for testing the search functionality.
  
   - "steps" package which contains the following .py files:
     - "login_steps" : this file contains the steps that each test on the authentication page follows;
     - "main_page_steps" : this file contains the steps that each test on the main page follows;
     - "search_functionality_steps" : this file contains the steps that each test regarding the search functionality follows.

- "behave-report.html" = this is the report generated when running the tests;
- behave.ini : this contains the html formatter;
- "browser.py" : this file sets up our browser;
- "environment.py" : here we instantiate the objects from our classes so that they (the objects) can be used throughout the project.

## Libraries used
- behave;
- selenium;
- time;
- webdriver_manager;
- HtmlTestRunner (*If not installable via pip, search for 'html-testRunner' in Python packages*).

## Installation
To install the required libraries, use the following commands:
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
- to run the desired tests use the following command "behave -f html -o behave-report.html --tags=your_tag" , be sure to replace the "your_tag" with the desired test tag
- to run the entire project use the command "behave -f html -o behave-report.html" , I do advise against running the entire project at once, since some functionalities like the newsletter become unreachable because of the built in security of the website, more details at the ***Known Issues*** section.

## Known Issues and Recommendations
- Fix the price filter issue for more accurate filtering:
  - when setting the price filter, setting the drag and drop at the very end makes the filter to be set on 0 (in the code), but not visually, additionally, because selenium acts so   fast while setting the drag and drop at 0, the visual price still remains at the max.

- Sometimes the tests regarding the "social_media.feature" and "newsletter.feature" will not work if the entire project is ran, but will work when ran separately;

- The tests from the feature "cart.feature" might not work if the size of the product is out of stock.








