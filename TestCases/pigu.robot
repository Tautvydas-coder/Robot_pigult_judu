*** Settings ***
Library  SeleniumLibrary
Variables  ../Resources/variables.py
*** Variables ***
${URL}  https://pigu.lt/lt/
${ACCEPT_COOKIES}  xpath:/html/body/div[1]/div[1]/div[1]/div/div/div[2]/button
${SEARCH_BAR}  xpath:/html/body/div[1]/div[1]/div/div[1]/div/div/div[3]/div[2]/form/div/span/input[1]
${PRODUCT_TYPE}  xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[1]/div/div/div[5]/div[2]
${PRODUCT}  xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[1]/div/div
${CART_BUTTON}  xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[1]/div/div/a[2]
*** Test Cases ***
[Setup]  Run Keywords  Open Browser  ${URL}  ${Browser}
    ...              AND   Set Selenium Speed  ${SELSPEED}  AND  ${MAX_WINDOW}
TC_01 Adding product to Cart
    Click Element  ${ACCEPT_COOKIES}
    Input Text    ${SEARCH_BAR}  ${PRODUCT_NAME}
    Press Key   ${SEARCH_BAR}  ${ENTER}
    Scroll Element Into View   ${PRODUCT_TYPE}
    Mouse Over    ${PRODUCT}
    Click Element  ${CART_BUTTON}
*** Keywords ***
