*** Settings ***
Library  SeleniumLibrary
Library  DateTime

*** Variables ***
${url_tc}  https://automationfc.github.io/dynamic-loading/
${url_tc5}    https://demos.telerik.com/aspnet-ajax/ajaxloadingpanel/functionality/explicit-show-hide/defaultcs.aspx
${url_tc6}    https://automationfc.github.io/fluent-wait/
${url_tc8}    https://admin-demo.nopcommerce.com/login?ReturnUrl=%2Fadmin%2F
${browser}  chrome

${Auto_Button_Start}    //button[text()='Start']
${Auto_TextVerify_HelloWorld}    //div[string()='Hello World!']
${Auto_LoadingVerify_Loading}    //div[@id='loading']
${Auto_CountdownTime}    //div[@id='javascript_countdown_time']

${Demos_DateTime}    //div[@class='contentWrapper']

${admindemo_Textbox_Email}    //input[@id='Email']
${admindemo_Textbox_Password}    //input[@id='Password']
${admindemo_Button_Login}    //button[text()='Log in']
${admindemo_A_Logout}    //a[text()='Logout']
*** Test Cases ***
Exercise 01: Static Wait
    Log To Console  Step 01 - Open website:https://automationfc.github.io/dynamic-loading/
    Open Browser    ${url_tc}    ${browser}
    Maximize Browser Window

    Log To Console  Step 02 - Click the Start button
    Click Button    ${Auto_Button_Start}

    Log To Console  Step 03 - Define a static wait (Thread.sleep)
    Sleep    5

    Log To Console  Step 04 - Wait result text will appear

    Log To Console  Step 05 - Check result text is "Hello World!"
    ${verift_text}=    Get Text    ${Auto_TextVerify_HelloWorld}
    Should Be Equal    ${verift_text}    Hello World!

    Close Browser
Exercise 02: Implicit wait
    Log To Console  Step 01 - Open website:https://automationfc.github.io/dynamic-loading/
    Open Browser    ${url_tc}    ${browser}
    Set Browser Implicit Wait    2
    Maximize Browser Window

    Log To Console  Step 02 - Define an implicit wait (If you set 2 seconds, test will fail)

    Log To Console  Step 03 - Click the Start button
    Click Button    ${Auto_Button_Start}

    Log To Console  Step 04 - Check result text is "Hello World!"
    ${verift_text}=    Get Text    ${Auto_TextVerify_HelloWorld}
    Should Be Equal    ${verift_text}    Hello World!

    Close Browser
Exercise 03: Explicit wait (Invisible)
    Log To Console  Step 01 - Open website:https://automationfc.github.io/dynamic-loading/
    Open Browser    ${url_tc}    ${browser}
    Maximize Browser Window

    Log To Console  Step 02 - Click the Start button
    Click Button    ${Auto_Button_Start}

    Log To Console  Step 03 - Wait loading icon invisible**
    Wait Until Element Is Visible    ${Auto_LoadingVerify_Loading}    3

    Log To Console  Step 04 - Check result text is "Hello World!"
    ${verift_text}=    Get Text    ${Auto_TextVerify_HelloWorld}
    Should Be Equal    ${verift_text}    Hello World!

    Close Browser
Exercise 04: Explicit wait (Visible)
    Log To Console  Step 01 - Open website:https://automationfc.github.io/dynamic-loading/
    Open Browser    ${url_tc}    ${browser}
    Maximize Browser Window

    Log To Console  Step 02 - Click the Start button
    Click Button    ${Auto_Button_Start}

    Log To Console  Step 03 - Wait “Hellow World” visible
    Wait Until Element Is Visible    ${Auto_TextVerify_HelloWorld}    3

    Close Browser
Exercise 05: Explicit wait
    Log To Console  Step 01 - Open website: https://demos.telerik.com/aspnet-ajax/ajaxloadingpanel/functionality/explicit-show-hide/defaultcs.aspx
    Open Browser    ${url_tc5}    ${browser}
    Maximize Browser Window

    Log To Console  Step 02 - Wait cho "Date Time" được hiển thị (sử dụng: visibility)
    Wait Until Element Is Visible    ${Demos_DateTime}    10

    Log To Console  Step 03 - In ra ngày đã chọn (Before AJAX call) -> hiện tại chưa chọn nên in ra = "No Selected Dates to display." -
    # Chua xong
Exercise 06: Fluent Wait
    Log To Console  Step 01 - Open website:https://automationfc.github.io/fluent-wait/
    Open Browser    ${url_tc6}    ${browser}
    Maximize Browser Window

    Log To Console  Step 02 - Wait cho đến khi countdown time được visible (visibility)
    Wait Until Element Is Visible    ${Auto_CountdownTime}    5

    Log To Console  Step 03 - Sử dụng Fluent wait
    Wait Until Keyword Succeeds    15    1
    # Chua xong
Exercise 07: Fluent Wait
    Log To Console  Step 01 - Open website:https://automationfc.github.io/dynamic-loading/
    Open Browser    ${url_tc}    ${browser}
    Maximize Browser Window

    Log To Console  Step 02 - Click the Start button
    Click Button    ${Auto_Button_Start}

    Log To Console  Step 03 - Apply fluent wait để mỗi 0.1s kiểm tra 1 lần xem Hello World text đã được hiển thị hay chưa
    Wait Until Keyword Succeeds    10    0.1    Element Should Be Visible    ${Auto_TextVerify_HelloWorld}

    Close Browser

Exercise 08: Page ready
    Log To Console  Step 01: Open website https://admin-demo.nopcommerce.com/login?ReturnUrl=%2Fadmin%2F
    Open Browser    ${url_tc8}    ${browser}
    Maximize Browser Window

    Log To Console  Step 02: Login with valid data
    Input Text    ${admindemo_Textbox_Email}    admin@yourstore.com
    Input Text    ${admindemo_Textbox_Password}    admin
    Click Button    ${admindemo_Button_Login}

    Log To Console  Step 03: Wait for logging in successfully
    Wait Until Element Is Visible    ${admindemo_A_Logout}    5

    Close Browser
    # Dang bi dinh xac minh tu dong
*** Keywords ***