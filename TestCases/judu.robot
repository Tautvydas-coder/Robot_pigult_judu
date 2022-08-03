*** Settings ***
Library  SeleniumLibrary
Variables  ../Resources/variables.py
*** Variables ***
${ACCEPT_COOKIES}=  xpath:/html/body/div[2]/div[2]/button[1]
${URL}  https://judu.lt/
*** Test Cases ***
[Setup]  Run Keywords  Open Browser  ${URL}  ${Browser}
    ...              AND   Set Selenium Speed  ${SELSPEED}  AND  ${MAX_WINDOW}
TC_01 Choose first ExpressBus Stop
    Click Element  ${ACCEPT_COOKIES}
    Scroll Element Into View    ${BUS_SCHEDULE}
    Click Element    ${BUS_SCHEDULE}
    Wait Until Page Contains Element    ${SCHEDULE_IFRAME}
    Select Frame   ${SCHEDULE_IFRAME}
    Click Element  ${EXPRESS_BUSES}
    Click Element  ${FIRST_EXPRESS_BUS}
    Click Element    ${FIRST_BUS_STOP}
    Element Attribute Value Should Be  xpath://*[@id="schedule-new-stops"]/div[2]  class  stop-toggle-container active
*** Keywords ***