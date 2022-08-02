*** Settings ***
Library  SeleniumLibrary
Variables  ../Resources/variables.py
*** Variables ***
${URL}  https://pigu.lt/lt/
${ACCEPT_COOKIES}  xpath:/html/body/div[1]/div[1]/div[1]/div/div/div[2]/button
${SEARCH_BAR}  xpath:/html/body/div[1]/div[1]/div/div[1]/div/div/div[3]/div[2]/form/div/span/input[1]
*** Test Cases ***
[Setup]  Run Keywords  Open Browser  ${URL}  ${Browser}
    ...              AND   Set Selenium Speed  ${SELSPEED}  AND  ${MAX_WINDOW}
TC_01 Adding product to Cart
    Click Element  ${ACCEPT_COOKIES}
    Input Text    ${SEARCH_BAR}  ${PRODUCT_NAME}
    Press Key   ${SEARCH_BAR}  ${ENTER}
    Scroll Element Into View   ${PRODUCT}${NUMBER}${TYPE}
    Mouse Over    ${PRODUCT}${NUMBER}
    Click Element  ${PRODUCT}${NUMBER}${CART_BUTTON}
*** Keywords ***
