*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Browser}  Chrome
${URL}  https://judu.lt/
*** Test Cases ***
TC_01 Open Browser
    Set Selenium Speed  2
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
TC_02 Accept Cookies
    Click Element  xpath:/html/body/div[2]/div[2]/button[1]
TC_03 Press Route Schedules
    Scroll Element Into View    xpath:/html/body/div[1]/div[2]/div[2]/section/div/div[1]/div/div[1]/div/ul/li[2]/a
    Click Element    xpath:/html/body/div[1]/div[2]/div[2]/section/div/div[1]/div/div[1]/div/ul/li[2]/a
TC_05 Press On expressBus
    Set Selenium Speed  2
    Wait Until Page Contains Element    xpath:/html/body/div[3]/div[4]/div[1]/div[3]/div[1]/span[5]
    Mouse Over    xpath:/html/body/div[3]/div[4]/div[1]/div[3]/div[1]/span[5]
    FOR    ${i}    IN RANGE    1    5
        Click Element  xpath:/html/body/div[3]/div[4]/div[1]/div[3]/div[1]/span[5]
    END
*** Keywords ***