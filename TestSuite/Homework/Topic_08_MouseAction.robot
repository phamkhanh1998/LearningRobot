*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${url_tc1}  https://demoqa.com/buttons
${url_tc2}  https://demoqa.com/tool-tips
${url_tc3}  https://automationfc.github.io/basic-form/index.html#
${browser}  chrome

${QADemo_Button_DoubleClick}  //button[@id='doubleClickBtn']
${QADemo_Verify_DoubleClick}  //p[text()='You have done a double click']
${QADemo_Button_RightClick}  //button[@id='rightClickBtn']
${QADemo_Verify_RightClick}  //p[text()='You have done a right click']
${QADemo_Button_Hover}  //button[@id='toolTipButton']
${QADemo_Button_Tooltip}  //div[text()='You hovered over the Button']

${Automationfc_IMG_img1}  //img[@alt='User Avatar 01']
${Automationfc_Verify_img1}  //h5[text()='Name: User1']
${Automationfc_IMG_img2}  //img[@alt='User Avatar 02']
${Automationfc_Verify_img2}  //h5[text()='Name: User2']
${Automationfc_IMG_img3}  //img[@alt='User Avatar 03']
${Automationfc_Verify_img3}  //h5[text()='Name: User3']
${Automationfc_IMG_img4}  //img[@alt='User Avatar 04']
${Automationfc_Verify_img4}  //h5[text()='Name: User4']
${Automationfc_IMG_img5}  //img[@alt='User Avatar 05']
${Automationfc_Verify_img5}  //h5[text()='Name: User5']
${Automationfc_A_tooltip}  //a[text()='Hover over me']
${Automationfc_Button_DoubleClick}  //button[text()='Double click me']
${Automationfc_Verify_DoubleClick}  //p[text()='Hello Automation Guys!']

*** Test Cases ***
TC 01
    Log To Console    S1: Open website https://demoqa.com/buttons
    Open Browser  ${url_tc1}  ${browser}
    Set Selenium Implicit Wait    10
    Maximize Browser Window
    
    Log To Console    S2: Double-click on the button "Double-click me"
    Double Click Element    ${QADemo_Button_DoubleClick}
    
    Log To Console    S3: Verify the text "You have done a double click" displayed
    Element Should Be Visible    ${QADemo_Verify_DoubleClick}

    Log To Console    S4: Right-click on "Right click me"
    Open Context Menu    ${QADemo_Button_RightClick}

    Log To Console    Verify the text "You have done a right click" displayed
    Element Should Be Visible    ${QADemo_Verify_RightClick}

    Close Browser

TC 02
    Log To Console    S1: Open website https://demoqa.com/tool-tips
    Open Browser  ${url_tc2}  ${browser}
    Set Selenium Implicit Wait    10
    Maximize Browser Window

    Log To Console    S2: Hover the button "Hover me to see"
    Mouse Over    ${QADemo_Button_Hover}
    
    Log To Console    S3: Verify text in the tooltip "You hovered over the Button" displayed
    Element Should Be Visible    ${QADemo_Button_Tooltip}

    Close Browser

TC 03
    Log To Console    S1: Open website https://automationfc.github.io/basic-form/index.html#
    Open Browser  ${url_tc3}  ${browser}
    Set Selenium Implicit Wait    10
    Maximize Browser Window

    Log To Console    S2: Scroll to “6. Hover” element
    Mouse Over    ${Automationfc_IMG_img1}

    Log To Console    S3: Verify element displays on the screen
    Element Should Be Visible    ${Automationfc_Verify_img1}
    
    Log To Console    S4: Scroll to “6. Hover” element to above page, S5: Hover each image in this area, S6: Verify name of the image show correctly (‘User’ + index of image)
    Mouse Over    ${Automationfc_IMG_img1}
    Element Should Be Visible    ${Automationfc_Verify_img1}
    Mouse Over    ${Automationfc_IMG_img2}
    Element Should Be Visible    ${Automationfc_Verify_img2}
    Mouse Over    ${Automationfc_IMG_img3}
    Element Should Be Visible    ${Automationfc_Verify_img3}
    Mouse Over    ${Automationfc_IMG_img4}
    Element Should Be Visible    ${Automationfc_Verify_img4}
    Mouse Over    ${Automationfc_IMG_img5}
    Element Should Be Visible    ${Automationfc_Verify_img5}

    Log To Console    S7: On the Tooltip area, hover “Hover over me” link
    Mouse Over    ${Automationfc_A_tooltip}
    
    Log To Console    S8: Verify the tooltip is “Hooray!”
    ${text_tooltip}=  Get Element Attribute    ${Automationfc_A_tooltip}    title
    Should Be Equal    ${text_tooltip}    Hooray!
    
    Log To Console    S9: Double-click on “Double click me” element
    Double Click Element    ${Automationfc_Button_DoubleClick}

    Log To Console    S10: Verify message “Hello Automation Guys!” displays
    Element Should Be Visible    ${Automationfc_Verify_DoubleClick}

    Close Browser

*** Keywords ***
