*** Settings ***
Library  SeleniumLibrary
Variables  ../Resources/variables.py
Resource  ../Resources/Configurations.robot
Test Setup  StartBrowserAndMaximizeAndSpeed
Test Teardown  closeBrowserWindow
*** Variables ***
${count_product}=  0
${first_product}=  1
${steps}=  4
${last_product}=  16
*** Test Cases ***
TC_01 Adding product to Cart
    Click Element  ${ACCEPT_COOKIES}
    Input Text    ${SEARCH_BAR}  ${PRODUCT_NAME}
    Press Key   ${SEARCH_BAR}  ${ENTER}
    Scroll Element Into View   ${PRODUCT}${NUMBER}${TYPE}
    Mouse Over    ${PRODUCT}${NUMBER}
    Click Element  ${PRODUCT}${NUMBER}${CART_BUTTON}
TC_02 Adding products to Cart
    Click Element  ${ACCEPT_COOKIES}
    Input Text    ${SEARCH_BAR}  ${PRODUCT_NAME}
    Press Key   ${SEARCH_BAR}  ${ENTER}
    ${products_num}=  selectProducts  ${first_product}  ${steps}  ${last_product}  ${count_product}
    buyProduct  ${products_num}
*** Keywords ***
selectProducts
    [Arguments]  ${first}  ${step}  ${last}  ${index}
    FOR  ${prod}  IN RANGE  ${first}   ${last}  ${step}
        Scroll Element Into View    xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[${prod}]/div/div/div[5]/div[2]
        Mouse Over    xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[${prod}]/div/div
        Click Element    xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[${prod}]/div/div/a[2]
        Wait Until Page Contains Element    ${MODAL}
        Click Element    ${BUY_CONTINUE}
        ${index}=  Evaluate  ${index} + 1
    END
    [Return]  ${index}
buyProduct
    [Arguments]  ${count}
    ${products_sum}=  Get Text  ${ADDED_PRODUCT_SUM}
    IF     ${count} == ${products_sum}
        Mouse Over  ${CART}
        Click Element    ${BUY_PRODUCTS_BUTTON}
    END