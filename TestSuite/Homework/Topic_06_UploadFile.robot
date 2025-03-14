*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url_tc}  https://www.fahasa.com/customer/account/create
${url_tc2}  https://blueimp.github.io/jQuery-File-Upload/
${browser}  chrome

${Fahasa_Li_DangNhap}  //a[text()='Đăng nhập']
${Fahasa_Textbox_SDT}  //input[@id='login_username']
${Fahasa_Textbox_Password}  //input[@id='login_password']
${Fahasa_Button_DangNhap}  //div[@id='fhs_top_account_hover']//button[string()='Đăng nhập']

${Bluimp_Button_AddFiles}  //input[@type='file']
${file_path1}  ${EXECDIR}\\TestData\\img.jpg
${file_path2}  ${EXECDIR}\\TestData\\img2.jpg
${file_path3}  ${EXECDIR}\\TestData\\img3.jpg
${Verify_Img}  //p[text()='img.jpg']
${Verify_Img2}  //p[text()='img2.jpg']
${Verify_Img3}  //p[text()='img3.jpg']
${Bluimp_Button_Start}  //p[text()='img.jpg']/../..//span[text()='Start']
${Bluimp_Button_Start2}  //p[text()='img2.jpg']/../..//span[text()='Start']
${Bluimp_Button_Start3}  //p[text()='img3.jpg']/../..//span[text()='Start']
${Bluimp_Verify_Img}  //a[text()='img.jpg']/../../..//span[text()='Delete']
${Bluimp_Verify_Img2}  //a[text()='img2.jpg']/../../..//span[text()='Delete']
${Bluimp_Verify_Img3}  //a[text()='img3.jpg']/../../..//span[text()='Delete']


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

TC02 - Handle Upload File By Choose File Action
    Log To Console    S1: Open https://blueimp.github.io/jQuery-File-Upload/
    Open Browser  ${url_tc2}  ${browser}
    Maximize Browser Window
    
    Log To Console    S2: Upload 3 images consequently
    Choose File    ${Bluimp_Button_AddFiles}    ${file_path1}
    Choose File    ${Bluimp_Button_AddFiles}    ${file_path2}
    Choose File    ${Bluimp_Button_AddFiles}    ${file_path3}
    
    Log To Console    S3: Verify 3 names of images show correctly
    Page Should Contain Element    ${Verify_Img}
    Page Should Contain Element    ${Verify_Img2}
    Page Should Contain Element    ${Verify_Img3}

    Log To Console    S4: Click on Start button
    Click Element    ${Bluimp_Button_Start}
    Click Element    ${Bluimp_Button_Start2}
    Click Element    ${Bluimp_Button_Start3}
    Sleep    5

    Log To Console    S5: Verify 3 images are uploaded successfully
    Page Should Contain Element    ${Bluimp_Verify_Img}
    Page Should Contain Element    ${Bluimp_Verify_Img2}
    Page Should Contain Element    ${Bluimp_Verify_Img3}

    Close Browser

TC03 - Handle Upload Multiple File By Choose File Action
    Log To Console    S1: Open https://blueimp.github.io/jQuery-File-Upload/
    Open Browser  ${url_tc2}  ${browser}
    Maximize Browser Window

    Log To Console    S2: Upload 3 images consequently
    Choose File    ${Bluimp_Button_AddFiles}    ${file_path1}\n${file_path2}\n${file_path3}

    Log To Console    S3: Verify 3 names of images show correctly
    Page Should Contain Element    ${Verify_Img}
    Page Should Contain Element    ${Verify_Img2}
    Page Should Contain Element    ${Verify_Img3}

    Log To Console    S4: Click on Start button
    Click Element    ${Bluimp_Button_Start}
    Click Element    ${Bluimp_Button_Start2}
    Click Element    ${Bluimp_Button_Start3}
    Sleep    5

    Log To Console    S5: Verify 3 images are uploaded successfully
    Page Should Contain Element    ${Bluimp_Verify_Img}
    Page Should Contain Element    ${Bluimp_Verify_Img2}
    Page Should Contain Element    ${Bluimp_Verify_Img3}
*** Keywords ***