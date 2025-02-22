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

TC02:
    Log To Console    S1:Open “https://demos.telerik.com/kendo-ui/radiobutton/index” with Chrome
    Open Browser  ${url_radio}  ${browser}
    Set Selenium Implicit Wait    30
    
    Log To Console    S2:Verify 1.4 Petrol, 92kW  is selected
    Radio Button Should Be Set To    engine    engine1

    Log To Console    S3:Click on “2.0 Petrol, 147kW” option
    Select Radio Button    engine    engine3

    Log To Console    S4:Verify “2.0 Petrol, 147kW” is selected
    Radio Button Should Be Set To    engine    engine3
    
    Log To Console    S5:Verify 1.4 Petrol, 92kW  is NOT selected
    Radio Button Should Not Be Selected    engine
    
TC03:
    Log To Console    S1:Open “https://material.angular.io/components/radio/examples” with Chrome
    Open Browser  ${url_material}  ${browser}
    Set Selenium Implicit Wait    30
    
    Log To Console    S2:Click on the Winter option
    Select Radio Button    mat-radio-group-0    Winter
    
    Log To Console    S3:Verify the Winter option is selected
    Radio Button Should Be Set To    mat-radio-group-0    Winter
    
    Log To Console    S4:Click on the Summer option
    Select Radio Button    mat-radio-group-0    Summer
    
    Log To Console    S5:Verify the Summer option is selected
    Radio Button Should Be Set To    mat-radio-group-0    Summer
    
    Log To Console    S6:Verify the Winter option is NOT selected
    Radio Button Should Not Be Selected    mat-radio-group-0
    
TC04:
    Log To Console    S1:Access https://login.ubuntu.com/
    Open Browser  ${url_ubuntu}  ${browser}
    Set Selenium Implicit Wait    30

    Log To Console    S2 Click vaof i don't have an uo account
    Select Radio Button    user-intentions    create
    
    Log To Console    S3 Click vao cai con lai
    Select Radio Button    user-intentions    id_returning_user


*** Keywords ***