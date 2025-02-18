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
    [documentation]  TC01 - Enter your information

    Open Browser  ${url}  ${browser}
    Input Text  ${Textbox_textbox_FullName}  ${username}
    Input Text  ${Textbox_textbox_Email}  ${email}
    Input Text  ${Textbox_textarea_CurrentAdd}  ${current_address}
    Input Text  ${Textbox_textarea_PermanentAdd}  ${permanent_address}
    Click Button  ${Textbox_button_Submit}

    Element Should Contain  ${Output_validate_FullName}  ${username}
    Element Should Contain  ${Output_validate_Email}  ${email}
    Element Should Contain  ${Output_validate_CurrentAdd}  ${current_address}
    Element Should Contain  ${Output_validate_PermanentAdd}  ${permanent_address}

    Close Browser

#//input[@id='firstName']
#//input[@id='lastName']
#//input[@id='userEmail']
#//input[@value='Male']
#//input[@value='Female']
#//input[@value='Other']
#//input[@id='userNumber']
#//div[@id='dateOfBirth']
#//input[@id='subjectsInput']
#//input[@value='1']
#//input[@value='2']
#//input[@value='3']
#//input[@id='uploadPicture']
#//textarea[@id='currentAddress']
#//div[text()='Select State']
#//div[text()='Select City']
#//button[@id='submit']


*** Keywords ***
