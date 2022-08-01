*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Browser}  Chrome
${URL}  https://pigu.lt/lt/

*** Test Cases ***
TC_01 Open Browser
    Set Selenium Speed    2
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
TC_02 Accept Cookies
    Set Selenium Speed    2
    Click Element  xpath:/html/body/div[1]/div[1]/div[1]/div/div/div[2]/button
TC_03 Input Search and Press Enter
    Set Selenium Speed    2
    Input Text    xpath:/html/body/div[1]/div[1]/div/div[1]/div/div/div[3]/div[2]/form/div/span/input[1]  alkotesteris
    Press Key   xpath:/html/body/div[1]/div[1]/div/div[1]/div/div/div[3]/div[2]/form/div/span/input[1]  \\13
TC_04 Show Cart
    Set Selenium Speed    2
    Scroll Element Into View    xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[1]/div/div/div[5]/div[2]
    Mouse Over    xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[1]/div/div
TC_05 Press to Cart
    Set Selenium Speed    2
    Click Element  xpath:/html/body/div[1]/div[8]/div[1]/section/div/div/div[2]/section/div[3]/div/div[1]/div/div/a[2]

*** Keywords ***
