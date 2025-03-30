*** Settings ***
Library  SeleniumLibrary
Library  DateTime

*** Variables ***
${url_tc1}  https://www.facebook.com/
${browser}  chrome

${Facebook_Textbox_Email}  //input[@id='email']
${Facebook_A_CreateAcc}  //a[string()='Create new account']
${Facebook_Select_Pronoun}  //select[@id='preferred_pronoun']
*** Test Cases ***
Exercise 01 - Element displays / visible
    Log To Console  S1: Open website https://www.facebook.com/
    Open Browser  ${url_tc1}  ${browser}
    Set Browser Implicit Wait    10
    Maximize Browser Window

    Log To Console  S2: Wait until “Email” textbox displays
    ${start_time}=  Get Time
    Wait Until Element Is Visible  ${Facebook_Textbox_Email}  10
    ${end_time}=  Get Time
    ${wait_time}=  Subtract Date From Date  ${end_time}  ${start_time}
    Log  Time waited: ${wait_time} seconds

    Close Browser

Exercise 02 - Element Invisible / Undisplay 01
    Log To Console  S1: Open website https://www.facebook.com/
    Open Browser  ${url_tc1}  ${browser}
    Set Browser Implicit Wait    10
    Maximize Browser Window

    Log To Console  S2: Click on “Create new account” button
    Click Element  ${Facebook_A_CreateAcc}

    Log To Console  S3: Verify that ‘Select your pronouns’ dropdown is not displayed on the screen
    ${start_time}=  Get Time
    Wait Until Element Is Not Visible  ${Facebook_Select_Pronoun}
    ${end_time}=  Get Time
    ${wait_time}=  Subtract Date From Date  ${end_time}  ${start_time}
    Log  Time waited: ${wait_time} seconds

    Close Browser

Exercise 03: Element Invisible / Undisplay 02
    Log To Console  S1: Open website https://www.facebook.com/
    Open Browser  ${url_tc1}  ${browser}
    Set Browser Implicit Wait    10
    Maximize Browser Window

    Log To Console  S2: Verify ‘Email address or phone number” textbox is displayed on the screen
    Element Should Be Visible  ${Facebook_Textbox_Email}

    Log To Console  S3: Click on “Create new account” button
    Click Element  ${Facebook_A_CreateAcc}

    Log To Console  S4: Verify ‘Email address or phone number” textbox is not displayed on the screen
    ${start_time}=  Get Time
    Wait Until Element Is Not Visible  ${Facebook_Textbox_Email}  10
    ${end_time}=  Get Time
    ${wait_time}=  Subtract Date From Date  ${end_time}  ${start_time}
    Log  Time waited: ${wait_time} seconds

    Close Browser

Exercise 04: Element Presence -> element is in DOM, even if the element displays or not
    Log To Console  S1: Open website https://www.facebook.com/
    Open Browser  ${url_tc1}  ${browser}
    Set Browser Implicit Wait    10
    Maximize Browser Window

    Log To Console  S2: Click on “Create new account” button
    Click Element  ${Facebook_A_CreateAcc}

    Log To Console  S3: Verify element //div[text()='Re-enter email address'] is presence
    Wait Until Page Contains    //div[text()='Re-enter email address']    10

    Close Browser
*** Keywords ***