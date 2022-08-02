*** Settings ***
Library  SeleniumLibrary
Variables  ../Resources/variables.py
*** Variables ***
${URL}  https://pigu.lt/lt/
${ACCEPT_COOKIES}  xpath:/html/body/div[1]/div[1]/div[1]/div/div/div[2]/button
${SEARCH_BAR}  xpath:/html/body/div[1]/div[1]/div/div[1]/div/div/div[3]/div[2]/form/div/span/input[1]

${first_product}=  1
${steps}=  4
${last_product}=  16
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

#Refactorint Setup, jog nereiktu kaskart pilno kviesti
[Setup]  Run Keywords  Open Browser  ${URL}  ${Browser}
...              AND   Set Selenium Speed  ${SELSPEED}  AND  ${MAX_WINDOW}
TC_02 Adding first column four products
    Click Element  ${ACCEPT_COOKIES}
    Input Text    ${SEARCH_BAR}  ${PRODUCT_NAME}
    Press Key   ${SEARCH_BAR}  ${ENTER}
    Select severale products  ${first_product}  ${steps}  ${last_product}
    Buy products  ${steps}
*** Keywords ***
Select severale products
    [Arguments]  ${first}  ${step}  ${last}
    FOR  ${prod}  IN RANGE  ${first}   ${last}  ${step}
        Scroll Element Into View    xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[${prod}]/div/div/div[5]/div[2]
        Mouse Over    xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[${prod}]/div/div
        Click Element    xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[${prod}]/div/div/a[2]
        #Failina, nes nespeja atrasti elemento po to kai jau yra 4i krepselyje. Atskirti nuo 42-44 eilutes is sito testcase (refactorint)
        Wait Until Page Contains Element    xpath:/html/body/div[12]/div/div/div/div[2]/div/div[2]
        Mouse Over    xpath:/html/body/div[12]/div/div/div/div[2]/div/div[2]/div/div[4]/div[1]/a
        Click Element    xpath:/html/body/div[12]/div/div/div/div[2]/div/div[2]/div/div[4]/div[1]/a
    END

Buy products
    [Arguments]  ${step}
    ${var}=  Get Text  xpath:/html/body/div[1]/div[1]/div/div[1]/div/div/div[3]/ul/li[3]/a/div/div/span[2]
    IF    ${step} == ${var}
        Mouse Over  xpath:/html/body/div[1]/div[1]/div/div[1]/div/div/div[3]/ul/li[3]
        Mouse Over    xpath:/html/body/div[1]/div[1]/div/div[1]/div/div/div[3]/ul/li[3]/div/div/div/ul/li[3]
        Click Element    xpath://*[@id="buttonContainer"]/a
    END