*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url_tc1}  https://ngoaingu24h.vn/
${url_tc2}  https://tiki.vn/
${url_tc3}  https://vnk.edu.vn/
${url_tc4}  https://www.javacodegeeks.com/
${browser}  chrome

${Ngoaingu_Button_DangNhap}  //button[string()='Đăng nhập']
${Ngoaingu_Popup_DangNhap}  //h2[string()='Đăng nhập']/parent::div
${Ngoaingu_Popup_Textbox_Username}  //input[@autocomplete='username']
${Ngoaingu_Popup_Textbox_Password}  //input[@autocomplete='new-password']
${Ngoaingu_Popup_Button_DangNhap}  //h2[@id='mui-3']/following::button[string()='Đăng nhập']
${Ngoaingu_Popup_VerifyMsg}  //div[text()='Bạn đã nhập sai tài khoản hoặc mật khẩu!']

${Tiki_Element_TaiKhoan}  //span[text()='Tài khoản']
${Tiki_Popup_DangNhap}  //h4[text()='Xin chào,']
${Tiki_Popup_DangNhapBangEmail}  //p[text()='Đăng nhập bằng email']
${Tiki_Popup_Button_DangNhap}  //button[text()='Đăng nhập']
${Tiki_Popup_EmailMsg}  //span[text()='Email không được để trống']
${Tiki_Popup_PasswordMsg}  //span[text()='Mật khẩu không được để trống']
${Tiki_Popup_Button_Close}  //button[@class='btn-close']

${VNK_Button_Popup}  //button[@class='pum-close popmake-close']

${Javacode_Element_Close}  //a[@onclick='return lepopup_close();']

*** Test Cases ***
TC01 - Fixed Popup (In DOM)
    Log To Console    S1: Open website https://ngoaingu24h.vn/
    Open Browser  ${url_tc1}  ${browser}
    Set Browser Implicit Wait    10
    Maximize Browser Window
    
    Log To Console    S2: Click on Dang Nhap button
    Click Button    ${Ngoaingu_Button_DangNhap}

    Log To Console    S3: Verify “Dang Nhap” popup appear
    ${checked_status}=  Run Keyword And Return Status    Element Should Be Visible    ${Ngoaingu_Popup_DangNhap}
    
    Log To Console    S4: Enter information to username/password = automationfc
    Input Text    ${Ngoaingu_Popup_Textbox_Username}    automationfc
    Input Text    ${Ngoaingu_Popup_Textbox_Password}    automationfc

    Log To Console    S5: Click on “Dang nhap” button
    Click Element    ${Ngoaingu_Popup_Button_DangNhap}
    
    Log To Console    S6: Verify message display with “Tai khoan khong ton tai” message
    ${checked_msg}=  Get Text    ${Ngoaingu_Popup_VerifyMsg}
    Should Be Equal    ${checked_msg}    Bạn đã nhập sai tài khoản hoặc mật khẩu!

    Close Browser

TC02 - Fixed Popup (not in DOM)
    Log To Console    S1: Open website https://tiki.vn/
    Open Browser  ${url_tc2}  ${browser}
    Set Browser Implicit Wait    10
    Maximize Browser Window
    
    Log To Console    S2: Click on “Dang nhap/Dang ki” button
    Click Element    //picture/img[@alt='close-icon']
    Click Element    ${Tiki_Element_TaiKhoan}
    
    Log To Console    S3: Verify popup displays
    Element Should Be Visible    ${Tiki_Popup_DangNhap}
    
    Log To Console    S4: Click on “Dang nhap bang email” button
    Click Element    ${Tiki_Popup_DangNhapBangEmail}
    
    Log To Console    S5: Keep the email/password fields are empty, S6: Click on “Dang nhap” button
    Click Button    ${Tiki_Popup_Button_DangNhap}
    
    Log To Console    S7: Verify error messages display
    Element Should Be Visible    ${Tiki_Popup_EmailMsg}
    Element Should Be Visible    ${Tiki_Popup_PasswordMsg}
    
    Log To Console    S8: Click on Close popup icon
    Click Button    ${Tiki_Popup_Button_Close}
    
    Log To Console    S9: Verify Popup disappears (by using Get WebElements)
    Element Should Not Be Visible    ${Tiki_Popup_DangNhap}

    Close Browser
TC03 - Random popup (in DOM)
    Log To Console    S1: Open website https://vnk.edu.vn/
    Open Browser  ${url_tc3}  ${browser}
    Set Browser Implicit Wait    10
    Maximize Browser Window
    
    Log To Console    S2: Click on Close popup button if the popup exists
    Click Button    ${VNK_Button_Popup}
    
    Log To Console    S3: Log to console title of the current page
    ${get_title}=  Get Title
    Log To Console    ${get_title}

    Close Browser

TC04 - Random popup (not in DOM)
    Log To Console    S1: Open website https://www.javacodegeeks.com/
    Open Browser  ${url_tc4}  ${browser}
    Set Browser Implicit Wait    10
    Maximize Browser Window
    
    Log To Console    S2: Close popup as needed
    Click Element    ${Javacode_Element_Close}

    Close Browser

*** Keywords ***