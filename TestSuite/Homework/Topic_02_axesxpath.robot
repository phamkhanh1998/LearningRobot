*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variable ***
${url}  https://opensource-demo.orangehrmlive.com/
${browser}  chrome
${username}  Admin
${password}  admin123
${firstname}  Pham
${middlename}  Quoc
${lastname}  Khanh
${myusername}  phamkhanh1
${mypassword}  khanh123


${Textbox_textbox_UserName}  //input[@name='username']
${Textbox_textbox_Password}  //input[@name='password']
${Textbox_button_Submit}  //button[@type='submit']
${Textbox_span_PIM}  //span[text()='PIM']
${Textbox_span_MyInfo}  //span[text()='My Info']
${Textbox_button_Add}  //button[@class='oxd-button oxd-button--medium oxd-button--secondary']
${Textbox_textbox_FirstName}  //input[@name='firstName']
${Textbox_textbox_MidName}  //input[@name='middleName']
${Textbox_textbox_LastName}  //input[@name='firstName']
${Textbox_textbox_Menu}  //p[@class='oxd-userdropdown-name']
${Textbox_textbox_Option}  //a[text()='Logout']

*** Test Cases ***
TC02: Create a new employee
    Log To Console    S1: Open “https://opensource-demo.orangehrmlive.com/” with chrome
    Open Browser  ${url}  ${browser}
    Set Browser Implicit Wait    30
    
    Log To Console    S2: Login with admin account (Admin/admin123)
    Input Text    ${Textbox_textbox_UserName}    ${username}
    Input Text    ${Textbox_textbox_Password}    ${password}
    Click Button    ${Textbox_button_Submit}
    
    Log To Console    S3: Open PIM page
    Click Element    ${Textbox_span_PIM}

    Log To Console    S4: Open the Add Employee page
    Click Button    ${Textbox_button_Add}
    Set Browser Implicit Wait    10
    
    Log To Console    S5: Enter the valid information
    Input Text    ${Textbox_textbox_FirstName}    ${firstname}
    Input Text    ${Textbox_textbox_MidName}    ${middlename}
    Input Text    ${Textbox_textbox_LastName}    ${lastname}

    Log To Console    S6: Logout
    Click Element    ${Textbox_textbox_Menu}
    Click Element    ${Textbox_textbox_Option}

    Close Browser
    
TC03 - Verify the new employee is created: 
    Log To Console    S1:Open “https://opensource-demo.orangehrmlive.com/” with Chrome
    Open Browser  ${url}  ${browser}
    Set Browser Implicit Wait    30
    
    Log To Console    S2: Login with the newly created account
    Input Text    ${Textbox_textbox_UserName}    ${myusername}
    Input Text    ${Textbox_textbox_Password}    ${mypassword}
    Click Button    ${Textbox_button_Submit}

    Log To Console    S3: Click to My Info
    Click Element    ${Textbox_span_MyInfo}

    Log To Console    S4: Verify the information is correct with TC01 information
    Element Text Should Be  ${Textbox_textbox_FirstName}  ${firstname}
    Element Text Should Be  ${Textbox_textbox_MidName}  ${middlename}
    Element Text Should Be  ${Textbox_textbox_LastName}  ${lastname}

    Close Browser

*** Keywords ***

