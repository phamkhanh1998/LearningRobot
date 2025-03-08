*** Settings ***
Library  SeleniumLibrary
Library  String
Library    Telnet

*** Variables ***
${url_tc}  https://automationfc.github.io/basic-form/index.html
${url_tc4}  http://admin:admin@the-internet.herokuapp.com/basic_auth
${browser}  chrome

${AutomationFC_Button_JSAlert}  //button[text()='Click for JS Alert']
${AutomationFC_Button_JSConfirm}  //button[text()='Click for JS Confirm']
${AutomationFC_Button_JSPrompt}  //button[text()='Click for JS Prompt']
${AutomationFC_Verify}  //p[@id='result']


*** Test Cases ***
TC01 - Accept Alert
    Log To Console    S1: Open https://automationfc.github.io/basic-form/index.html
    Open Browser  ${url_tc}  ${browser}
    Maximize Browser Window
    
    Log To Console    S2: Click to “Click for JS Alert” button
    Click Button    ${AutomationFC_Button_JSAlert}
    
    Log To Console    S3: Wait for alert present with “Click for JS Alert” message

    Log To Console    S4: Accept alert
    Handle Alert  Accept
    
    Log To Console    S5: Verify “You clicked an alert successfully” message displays
    Element Should Contain    ${AutomationFC_Verify}    You clicked an alert successfully

    Close Browser

TC02 - Confirm Alert
    Log To Console    S1: Open https://automationfc.github.io/basic-form/index.html
    Open Browser  ${url_tc}  ${browser}
    Maximize Browser Window
    
    Log To Console    S2: Click to “Click for JS Confirm” button
    Click Button    ${AutomationFC_Button_JSConfirm}
    
    Log To Console    S3: Wait for alert present with “I am a JS Confirm” message

    Log To Console    S4: Accept alert
    Handle Alert  Accept
    
    Log To Console    S5: Verify “You clicked: Ok” message displays
    Element Should Contain    ${AutomationFC_Verify}    You clicked: Ok

    Close Browser

TC03 - Prompt Alert
    Log To Console    S1: Open https://automationfc.github.io/basic-form/index.html
    Open Browser  ${url_tc}  ${browser}
    Maximize Browser Window

    Log To Console    S2: Click to “Click for JS Confirm” button
    Click Button    ${AutomationFC_Button_JSPrompt}
    
    Log To Console    S3: Wait for alert present with “I am a JS prompt” message
    
    Log To Console    S4: Enter your NAME into alert textbox, Accept alert
    Input Text Into Alert    Hello World!

    Log To Console    S5: Verify “You entered: NAME” message displays
    Element Should Contain    ${AutomationFC_Verify}  You entered: Hello World!

    Close Browser

TC04 - Authentication Alert 1
    Log To Console    S1: Open http://the-internet.herokuapp.com/basic_auth
    Open Browser  ${url_tc4}  ${browser}
    Maximize Browser Window
    
    Log To Console    S2: Enter username/password   (admin/admin)
*** Keywords ***