*** Settings ***
Library  SeleniumLibrary
Variables  variables.py
*** Variables ***
*** Keywords ***
StartBrowserAndMaximizeAndSpeed
    Open Browser  ${URL}  ${Browser}
    Set Selenium Speed  1.5
    Maximize Browser Window

closeBrowserWindow
    Close Browser
