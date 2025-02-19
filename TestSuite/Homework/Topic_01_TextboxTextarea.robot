*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***
${url}  https://demoqa.com/text-box
${browser}  chrome
${username}  kane
${email}  kane@gmail.com
${current_address}  1A Tay Ho HN
${permanent_address}  1A Tay Ho HN

${Textbox_textbox_FullName}  //input[@id='userName']
${Textbox_textbox_Email}  //input[@id='userEmail']
${Textbox_textarea_CurrentAdd}  //textarea[@id='currentAddress']
${Textbox_textarea_PermanentAdd}  //textarea[@id='permanentAddress']
${Textbox_button_Submit}  //button[@id='submit']

${Output_validate_FullName}  //div[@id='output']//p[@id='name']
${Output_validate_Email}  //div[@id='output']//p[@id='email']
${Output_validate_CurrentAdd}  //div[@id='output']//p[@id='currentAddress']
${Output_validate_PermanentAdd}  //div[@id='output']//p[@id='permanentAddress']

*** Test Cases ***
TC01 - Enter your information
    
    Log To Console    Open “https://demoqa.com/text-box” with Chrome
    Open Browser  ${url}  ${browser}
    
    Log To Console    Enter your information
    Input Text  ${Textbox_textbox_FullName}  ${username}
    Input Text  ${Textbox_textbox_Email}  ${email}
    Input Text  ${Textbox_textarea_CurrentAdd}  ${current_address}
    Input Text  ${Textbox_textarea_PermanentAdd}  ${permanent_address}
    
    Log To Console    Click Submit
    Click Button  ${Textbox_button_Submit}

    Log To Console    Verify the information displayed with the correct data
    Element Should Contain  ${Output_validate_FullName}  ${username}
    Element Should Contain  ${Output_validate_Email}  ${email}
    Element Should Contain  ${Output_validate_CurrentAdd}  ${current_address}
    Element Should Contain  ${Output_validate_PermanentAdd}  ${permanent_address}

    Close Browser

*** Keywords ***
