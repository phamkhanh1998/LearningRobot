*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***
${url_checkbox}  https://rode.com/en/support/where-to-buy
${browser}  chrome

${Number_Of_Dealers}  82

${Rode_Droplis_Main}  //select[@id='country']

${Rode_Button_Search}  //button[text()='Search']

${Rode_List_Dealers}  //div[@class='col-lg-6 p-1 overflow-hidden']


*** Test Cases ***
TC01 - Default Dropdown
    Log To Console    S1:Open https://rode.com/en/support/where-to-buy
    Open Browser  ${url_checkbox}  ${browser}
    Set Selenium Implicit Wait    30
    
    Log To Console    S2:Select “Vietnam” option on the dropdown list
    Click Element    ${Rode_Droplis_Main}
    Select From List By Value    ${Rode_Droplis_Main}  Vietnam
    
    Log To Console    S3:Verify “Vietnam” is selected
    ${checked_value}=  Get Selected List Value    ${Rode_Droplis_Main}
    Should Be Equal    ${checked_value}    Vietnam

    Log To Console    S4:Click on Search button
    Click Button    ${Rode_Button_Search}
    
    Log To Console    S5:Get the number of dealers
    ${checked_count_dealers}=  Get Element Count    ${Rode_List_Dealers}
    
    Log To Console    S6:Verify the number of deadlier is 2461?
    ${verify_count_dealers}=  Convert To Integer    ${Number_Of_Dealers}
    Should Be Equal  ${checked_count_dealers}  ${verify_count_dealers}
    
    Log To Console    Close browser
    Close Browser

*** Keywords ***