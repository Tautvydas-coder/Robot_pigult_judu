*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  BuiltIn
Variables  ../Resources/variables.py
*** Variables ***
${URL}  https://judu.lt/
${ACCEPT_COOKIES}  xpath:/html/body/div[2]/div[2]/button[1]
${BUS_SCHEDULE}  xpath:/html/body/div[1]/div[2]/div[2]/section/div/div[1]/div/div[1]/div/ul/li[2]
${SCHEDULE_IFRAME}  xpath:/html/body/div[1]/div[2]/div[2]/div[2]/div/div/iframe
${EXPRESS_BUSES}  xpath:/html/body/div[3]/div[4]/div[1]/div[3]/div[1]
${FIRST_EXPRESS_BUS}  xpath:/html/body/div[3]/div[4]/div[1]/div[3]/table[1]/tbody/tr[1]/td/div/a[1]/span[3]
${FIRST_BUS_STOP}  xpath: /html/body/div[3]/div[4]/div[3]/div[1]/div[3]/div[2]
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