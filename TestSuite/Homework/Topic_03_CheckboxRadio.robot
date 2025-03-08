*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***
${url_checkbox}  https://demos.telerik.com/kendo-ui/checkbox/index
${browser}  chrome
${url_radio}  https://demos.telerik.com/kendo-ui/radiobutton/index
${url_material}  https://material.angular.io/components/radio/examples
${url_ubuntu}  https://login.ubuntu.com/
${url_ggsheet}  https://docs.google.com/forms/d/e/1FAIpQLSfiypnd69zhuDkjKgqvpID9kwO29UCzeCVrGGtbNPZXQok0jA/viewform

${Demos_Checkbox_RearsideAirbags}  //input[@id='eq1']
${Demos_Checkbox_LuggagecompartmentCover}  //input[@id='eq3']

${Demos_Radio_1.4}  //input[@id='engine1']
${Demos_Radio_2.0}  //input[@id='engine3']

${Material_Radio_Winter}  //input[@id="mat-radio-0-input"]

*** Test Cases ***
TC01:
    Log To Console    S1:Open “https://demos.telerik.com/kendo-ui/checkbox/index” with Chrome
    Open Browser  ${url_checkbox}  ${browser}
    Set Selenium Implicit Wait    30

    Log To Console    S2:Verify “Rear side airbags”  and “Leather trim” are selected
    Checkbox Should Be Selected    ${Demos_Checkbox_RearsideAirbags}

    Log To Console    S3:Unselect “Rear side airbags” option
    Unselect Checkbox    ${Demos_Checkbox_RearsideAirbags}

    Log To Console    S4:Verify “Rear side airbags” is NOT selected
    Checkbox Should Not Be Selected    ${Demos_Checkbox_RearsideAirbags}

    Log To Console    S5:Select “Luggage compartment cover” option
    Select Checkbox    ${Demos_Checkbox_LuggagecompartmentCover}
    
    Log To Console    S6:Verify “Luggage compartment cover” is selected
    Checkbox Should Be Selected    ${Demos_Checkbox_LuggagecompartmentCover}

    Close Browser

TC02:
    Log To Console    S1:Open “https://demos.telerik.com/kendo-ui/radiobutton/index” with Chrome
    Open Browser  ${url_radio}  ${browser}
    Set Selenium Implicit Wait    30
    
    Log To Console    S2:Verify 1.4 Petrol, 92kW  is selected
    ${checked_value}=  Get Element Attribute    ${Demos_Radio_1.4}    checked
    Should Be Equal    ${checked_value}    true

    Log To Console    S3:Click on “2.0 Petrol, 147kW” option
    Select Radio Button    engine    engine3

    Log To Console    S4:Verify “2.0 Petrol, 147kW” is selected
    ${checked_value2}=  Get Element Attribute    ${Demos_Radio_2.0}    checked
    Should Be Equal    ${checked_value2}    true
    
    Log To Console    S5:Verify 1.4 Petrol, 92kW  is NOT selected
    ${checked_value}=  Get Element Attribute    ${Demos_Radio_1.4}    checked
    Should Be Equal As Strings    ${checked_value}    None

    Close Browser
    
TC03:
    Log To Console    S1:Open “https://material.angular.io/components/radio/examples” with Chrome
    Open Browser  ${url_material}  ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    30
    
    Log To Console    S2:Click on the Winter option
    Click Element    ${Material_Radio_Winter}
    
    Log To Console    S3:Verify the Winter option is selected
#   Sua theo get element atribute
    Radio Button Should Be Set To    mat-radio-group-0    Winter
    
    Log To Console    S4:Click on the Summer option
    Select Radio Button    mat-radio-group-0    Summer
    
    Log To Console    S5:Verify the Summer option is selected
    Radio Button Should Be Set To    mat-radio-group-0  Summer
    
    Log To Console    S6:Verify the Winter option is NOT selected
    ${checked_value}=  Get Element Attribute    //input[@id="mat-radio-0-input"]    tabindex
    Should Be Equal    ${checked_value}    -1

    Close Browser
    
TC04:
    Log To Console    S1:Access https://login.ubuntu.com/
    Open Browser  ${url_ubuntu}  ${browser}
    Set Selenium Implicit Wait    30

    Log To Console    S2 Click i don't have an uo account
    Click Element    //label[string()='I don’t have an Ubuntu One account']
    
    Log To Console    S3 Click I have an Ubuntu One account and my password is:
    Click Element    //label[@class='returning-user']

    # dung elemetn should not be visible

    Close Browser

*** Keywords ***