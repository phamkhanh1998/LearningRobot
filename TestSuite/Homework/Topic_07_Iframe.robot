*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${url_tc}  https://toidicodedao.com/
${url_tc2}  https://netbanking.hdfcbank.com/netbanking/
${url_tc3}  https://demoqa.com/frames
${url_tc3_a}    https://demoqa.com/nestedframes
${url_tc4}  https://demoqa.com/browser-windows
${url_tc5}  https://demo.nopcommerce.com/
${url_tc5_a}  https://demo.nopcommerce.com/login
${url_tc5_b}  https://demo.nopcommerce.com/register
${browser}  chrome

${CodeDao_Iframe_FB}    //iframe[@title='fb:page Facebook Social Plugin']
${CodeDao_VerifyIFrame_Title}   //a[text()='Tôi đi code dạo']
${CodeDao_VerifyIFrame_Follower}    //div[contains(text(),'followers')]

${Bank_Frame}    //frame[@name='login_page']
${Bank_Textbox_CustomID}    //input[@type='text']
${Bank_Button_Continue}    //a[text()='CONTINUE']
${Bank_VerifyPasswork}    //input[@id='keyboard']

${DemoQA_Iframe}    //iframe[@id='frame1']
${DemeQA_Iframe2}    //body[text()='Parent frame']/iframe
${DemoQA_VerifyH1}    //h1[@id='sampleHeading']
${DemoQA_Nestedframe_VerifyH1}    //h1[text()='Nested Frames']
${DemoQA_VerifyParent}    //body[text()='Parent frame']
${DemoQA_VerifyChild}    //body/p[text()='Child Iframe']

${DemoQA_Button_NewTab}    //button[@id='tabButton']
${DemoQA_Button_NewWindow}    //button[@id='windowButton']

*** Test Cases ***
TC01 - Handle Frame 1
    Log To Console  S1: Open website https://toidicodedao.com/
    Open Browser  ${url_tc}  ${browser}
    Set Selenium Implicit Wait    30
    Maximize Browser Window

    Log To Console  S2: Verify Facebook iframe displays
    Select Frame    ${CodeDao_Iframe_FB}
    Element Should Be Visible    ${CodeDao_VerifyIFrame_Title}

    Log To Console  S3: Verify the number of like is 403132
    ${checked_follow}=    Get Text    ${CodeDao_VerifyIFrame_Follower}
    ${list}=    Split String    ${checked_follow}    ${SPACE}
    ${follower_number}=    Replace String    ${list}[0]    ,    ${EMPTY}
    Should Be Equal    ${follower_number}    402K

    Close Browser

TC02 - Handle Frame 2
    Log To Console  S1: Open https://netbanking.hdfcbank.com/netbanking/
    Open Browser  ${url_tc2}  ${browser}
    Maximize Browser Window

    Log To Console  S2: Input valid value to Customer ID field
    Select Frame    ${Bank_Frame}
    Input Text  ${Bank_Textbox_CustomID}   07041998

    Log To Console  S3: Click on Continue button
    Click Element   ${Bank_Button_Continue}

    Log To Console  S4: Verify Password textbox displays
    Unselect Frame
    Element Should Be Visible    ${Bank_VerifyPasswork}

    Close Browser

TC03 - Nested Frame
    Log To Console  S1: Open https://demoqa.com/browser-windows
    Open Browser  ${url_tc3}  ${browser}
    Set Selenium Implicit Wait    10
    Maximize Browser Window

    Log To Console  S2: Verify “This is a sample page” displays
    Select Frame    ${DemoQA_Iframe}
    Element Should Be Visible     ${DemoQA_VerifyH1}

    Log To Console  S3: Open https://demoqa.com/nestedframes
    Go To  ${url_tc3_a}

    Log To Console  S4: Verify “Parent frame” and “Child Iframe” messages display
    Select Frame    ${DemoQA_Iframe}
    Element Should Be Visible    ${DemoQA_VerifyParent}
    Select Frame    ${DemeQA_Iframe2}
    Element Should Be Visible    ${DemoQA_VerifyChild}
    Unselect Frame
    Unselect Frame

    Log To Console  S5: Verify “Nested Frames” displays
    Element Should Be Visible    ${DemoQA_Nestedframe_VerifyH1}

    Close Browser

TC04 - Window - Tabs 1
    Log To Console  S1: Open https://demoqa.com/browser-windows
    Open Browser  ${url_tc4}  ${browser}
    Set Selenium Implicit Wait    10
    Maximize Browser Window

    Log To Console  S2: Click on “New Tab” button
    Click Button    ${DemoQA_Button_NewTab}

    Log To Console  S3: Switch to new tab and go to https://www.google.com/ website
    Switch Window    NEW
    Go To    https://www.google.com/

    Log To Console  S4: Back to old tab, click on “New Window” button
    Switch Window    MAIN
    Click Button    ${DemoQA_Button_NewWindow}

    Log To Console  S5: Switch to new window, verify “This is a sample page” message displays
    Switch Window    NEW
    Page Should Contain    This is a sample page

    Log To Console  S6: Switch to tab (step 03), verify title is “Google”
    Switch Window    MAIN
    ${get_window}=    Get Window Handles
    Log    ${get_window}
    Switch Window    Google
    ${get_title_gg}=    Get Title
    Should Be Equal    ${get_title_gg}    Google

    Close Browser

TC05 - Window - Tabs 2
    Log To Console    S1: Open a new brower with https://demo.nopcommerce.com/
    ${homebrowser}=  Open Browser  ${url_tc5}  ${browser}    homeprocess
    Log  ${homebrowser}
    Set Selenium Implicit Wait    10
    Maximize Browser Window

    Log To Console    S2: Verify title is “nopCommerce demo store. Home page title”
    ${get_title_nopcommerce}=  Get Title
    Should Be Equal  ${get_title_nopcommerce}  nopCommerce demo store. Home page title

    Log To Console    S3: Open a new brower with https://demo.nopcommerce.com/login
    ${loginbrowser}=  Open Browser  ${url_tc5_a}  ${browser}
    Log  ${loginbrowser}
    Set Selenium Implicit Wait    10
    Maximize Browser Window

    Log To Console    S4: Verify title is “nopCommerce demo store. Login”
    ${get_title_nopcommerce2}=  Get Title
    Should Be Equal  ${get_title_nopcommerce2}  nopCommerce demo store. Login

    Log To Console    S5: Open a new browser with https://demo.nopcommerce.com/register
    ${registerbrowser}=  Open Browser  ${url_tc5_b}  ${browser}
    Log  ${registerbrowser}
    Set Selenium Implicit Wait    10
    Maximize Browser Window

    Log To Console    S6: Verify title is “nopCommerce demo store. Register"
    ${get_title_nopcommerce3}=  Get Title
    Should Be Equal  ${get_title_nopcommerce3}  nopCommerce demo store. Register
    Switch Browser  homeprocess

TC06 - Demo Nopcommerce
    [Tags]  frame1
    Log To Console    S1: Open https://demo.nopcommerce.com/
    Open Browser  https://demo.nopcommerce.com/   chrome    options=add_argument('profile-directory=Profile 1');add_argument(r'user-data-dir=C:\\Users\\xghus\\AppData\\Local\\Google\\Chrome\\User Data')
    Set Selenium Implicit Wait    10
    Maximize Browser Window

    Log To Console  S2: Click on the Register link
    Click Element By Javascript  //a[text()= 'Register']

    Log To Console    S3: Enter all information by Javascript
    Click Element By Javascript  //input[@id='gender-male']
    Input Text By Javascript  //input[@id='FirstName']  Pham
    Input Text By Javascript  //input[@id='LastName']  Khanh
    Input Text By Javascript  //input[@id='Email']  phamkhanh@gmail.com
    Input Text By Javascript  //input[@id='Company']  Urbox
    Input Text By Javascript  //input[@id='Password']  12345678
    Input Text By Javascript  //input[@id='ConfirmPassword']  12345678

    Log To Console    S4: Click on Register button
    Click Element By Javascript  //button[@id='register-button']

    Log To Console    S5: Verify register successfully
    Page Should Contain  Your registration completed

    Close Browser

*** Keywords ***
Open New Tab With "${url}"
    Execute Javascript    window.open()
    Switch Window    NEW
    Go To    ${url}

Close The Current Tab
    Execute Javascript    window.close()
    Switch Window    MAIN

Get Window Height
    ${height}=    Execute Javascript    return screen.height
    RETURN    ${height}

Get Window Width
    ${width}=    Execute Javascript    return screen.width
    RETURN    ${width}

Get Domain Name By Javascript
    ${domain}=      Execute Javascript      return document.domain
    RETURN    ${domain}

Get URL By Javascript
    ${URL}=      Execute Javascript      return document.URL
    RETURN    ${URL}

Get Title By Javascript
    ${title}=      Execute Javascript      return document.title
    RETURN    ${title}

Get Innertext By Javascript
    ${innertext}=      Execute Javascript      return document.documentElement.innerText
    RETURN    ${innertext}

Get Element Validation Message
    [Arguments]      ${xpath}
    ${webElement}       Get WebElement    ${xpath}
    ${validation_message}=  Execute Javascript      return arguments[0].validationMessage      ARGUMENTS        ${webelement}
    Sleep   0.25
    RETURN    ${validation_message}

Scroll Up To The Top
    Execute Javascript      window.scrollTo(0, -document.body.scrollHeight)

Scroll To The Bottom
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight)

Scroll To Middle Of Page
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight/3)

Scroll To Element On Top
    [Arguments]      ${xpath}
    ${webElement}       Get WebElement    ${xpath}
    Execute Javascript      arguments[0].scrollIntoView(true);      ARGUMENTS        ${webelement}
    Sleep   0.25
Scroll To Element On Down
    [Arguments]      ${xpath}
    ${webElement}       Get WebElement    ${xpath}
    Execute Javascript      arguments[0].scrollIntoView(false);      ARGUMENTS        ${webelement}
    Sleep   0.25

Click Element By Javascript
    [Arguments]      ${xpath}
    ${webElement}       Get WebElement    ${xpath}
    Execute Javascript      arguments[0].click();      ARGUMENTS        ${webelement}
    Sleep   0.25

Input Text By Javascript
    [Arguments]      ${xpath}   ${value}
    ${webElement}       Get WebElement    ${xpath}
    Execute Javascript      arguments[0].setAttribute('value', '${value}')      ARGUMENTS        ${webelement}
    Sleep   0.25

Add Element Attribute Value By Javascript
    [Arguments]      ${xpath}    ${attribute_name}      ${attribute_value}
    ${webElement}       Get WebElement    ${xpath}
    Execute Javascript      arguments[0].setAttribute('${attribute_name}', '${attribute_value}')      ARGUMENTS        ${webelement}
    Sleep   0.25

Remove Element Attribute Value By Javascript
    [Arguments]      ${xpath}    ${attribute_name}      ${attribute_value}
    ${webElement}       Get WebElement    ${xpath}
    Execute Javascript      arguments[0].removeAttribute('${attribute_name}')      ARGUMENTS        ${webelement}
    Sleep   0.25

Is Page Ready
    ${is_ready}    Execute Javascript    return document.readyState=='complete' && (window.jQuery != null) && (jQuery.active==0)
    Should Be Equal    ${is_ready}    ${True}
