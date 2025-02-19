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
${my_username}  phamkhanh1
${my_password}  khanh123


${Textbox_textbox_UserName}  //input[@name='username']
${Textbox_textbox_Password}  //input[@name='password']
${Textbox_button_Submit}  //button[@type='submit']
${Textbox_button_Add}  //button[string()=' Add ']

${Textbox_textbox_FirstName}  //input[@name='firstName']
${Textbox_textbox_MidName}  //input[@name='middleName']
${Textbox_textbox_LastName}  //input[@name='lastName']

${Main_menu_PIM}  //span[text()='PIM']
${Main_menu_MyInfor}  //span[text()='My Info']
${Main_dropdown_UserInformation}  //p[@class='oxd-userdropdown-name']
${Main_button_Logout}  //a[text()='Logout']

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
    Click Element    ${Main_menu_PIM}

    Log To Console    S4: Open the Add Employee page
    Click Button    ${Textbox_button_Add}
    Set Browser Implicit Wait    10
    
    Log To Console    S5: Enter the valid information
    Input Text    ${Textbox_textbox_FirstName}    ${firstname}
    Input Text    ${Textbox_textbox_MidName}    ${middlename}
    Input Text    ${Textbox_textbox_LastName}    ${lastname}

    Log To Console    S6: Logout
    Click Element    ${Main_dropdown_UserInformation}
    Click Element    ${Main_button_Logout}

    Close Browser
    
TC03 - Verify the new employee is created: 
    Log To Console    S1:Open “https://opensource-demo.orangehrmlive.com/” with Chrome
    Open Browser  ${url}  ${browser}
    Set Browser Implicit Wait    30
    
    Log To Console    S2: Login with the newly created account
    Input Text    ${Textbox_textbox_UserName}    ${my_username}
    Input Text    ${Textbox_textbox_Password}    ${my_password}
    Click Button    ${Textbox_button_Submit}

    Log To Console    S3: Click to My Info
    Click Element    ${Main_menu_MyInfor}

    Log To Console    S4: Verify the information is correct with TC01 information
    Element Text Should Be  ${Textbox_textbox_FirstName}  ${firstname}
    Element Text Should Be  ${Textbox_textbox_MidName}  ${middlename}
    Element Text Should Be  ${Textbox_textbox_LastName}  ${lastname}

    Close Browser

*** Keywords ***

