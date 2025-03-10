*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url_tc}  https://www.fahasa.com/customer/account/create
${browser}  chrome

${Fahasa_Li_DangNhap}  //a[text()='Đăng nhập']
${Fahasa_Textbox_SDT}  //input[@id='login_username']
${Fahasa_Textbox_Password}  //input[@id='login_password']
${Fahasa_Button_DangNhap}  //div[@id='fhs_top_account_hover']//button[string()='Đăng nhập']
*** Test Cases ***
TC01: Handle Button
    Log To Console    S1: Open https://www.fahasa.com/customer/account/create
    Open Browser  ${url_tc}  ${browser}
    Maximize Browser Window
    
    Log To Console    S2: Click on “Đăng nhập” button
    Click Element    ${Fahasa_Li_DangNhap}
    
    Log To Console    S3: Enter “0123123123” to “Số điện thoại/Email” textbox
    Input Text    ${Fahasa_Textbox_SDT}    0123123123
    
    Log To Console    S4” Enter “Abc@12345” to “Mật khẩu” textbox
    Input Text    ${Fahasa_Textbox_Password}    Abc@12345
    
    Log To Console    S5: Verify that “Đăng nhập” button is enable
    Element Should Be Enabled    ${Fahasa_Button_DangNhap}

    Close Browser



*** Keywords ***