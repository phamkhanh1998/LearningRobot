*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***
${url_tc1}  https://rode.com/en/support/where-to-buy
${url_tc2}  https://demoqa.com/forms
${url_tc3}  https://jqueryui.com/resources/demos/selectmenu/default.html
${url_tc4}  https://react.semantic-ui.com/maximize/dropdown-example-selection/
${url_tc5}  https://mikerodham.github.io/vue-dropdowns/
${url_tc6}  https://react.semantic-ui.com/maximize/dropdown-example-search-selection/
${browser}  chrome

${Rode_Droplis_Main}  //select[@id='country']
${Rode_Button_Search}  //button[text()='Search']
${Rode_List_Dealers}  //div[@class='col-lg-6 p-1 overflow-hidden']

${Demoqa_Span_Form}  //span[text()='Practice Form']
${Demoqa_Textbox_FirstName}  //input[@id='firstName']
${Demoqa_Textbox_LastName}  //input[@id='lastName']
${Demoqa_Textbox_Email}  //input[@id='userEmail']
${Demoqa_Textbox_Number}  //input[@id='userNumber']
${Demoqa_Textbox_Date}  //input[@id='dateOfBirthInput']
${Demoqa_Textbox_Subject}  //div[@id='subjectsContainer']
${Demoqa_Checkbox_Male}  //input[@value='Male']
${Demoqa_Checkbox_Female}  //input[@value='Female']
${Demoqa_Checkbox_Other}  //input[@value='Other']
${Demoqa_Checkbox_Sports}  //input[@id='hobbies-checkbox-1']
${Demoqa_Checkbox_Reading}  //input[@id='hobbies-checkbox-2']
${Demoqa_Checkbox_Music}  //input[@id='hobbies-checkbox-3']
${Demoqa_UploadFile_Picture}  //input[@id='uploadPicture']
${Demoqa_Button_Submit}  //button[@id='submit']
${Demoqa_TextArea_Address}  //textarea[@id='currentAddress']
${Demoqa_Select_State}  //div[text()='Select State']
${Demoqa_Select_City}  //div[text()='Select City']
${Demoqa_Select_State_NCR}  //div[text()='NCR']
${Demoqa_Select_City_Delhi}  //div[text()='Delhi']

${Jquery_Select_Fast}  //div[text()='Faster']
${Jquery_Select_Speed}  //span[@id='speed-button']
${Jquery_Select_File}  //span[@id='files-button']
${Jquery_Select_jQuery}  //div[text()='jQuery.js']
${Jquery_Select_a_number}  7
${Jquery_Select_7}  //div[text()='7']
${Jquery_Select_Number}  //span[@id='number-button']
${Jquery_Select_Mrs}  //div[text()='Mrs.']
${Jquery_Select_Title}  //span[@id='salutation-button']

${ReactJS_Select_Main}  //div[text()='Select Friend']
${ReactJS_Select_SelectedEF}  //div[text()='Elliot Fu']
${ReactJS_Select_SelectedSF}  //div[text()='Stevie Feliciano']
${ReactJS_Select_EF}  //span[text()='Elliot Fu']
${ReactJS_Select_SF}  //span[text()='Stevie Feliciano']
${ReactJS_Select_JK}  //span[text()='Justen Kitsune']
${ReactJS_Select_Verify}  //div[@class='divider text']

${Vue_Select_Items}  //div[@class='btn-group']
${Vue_Select_FirstOp}  //a[contains(text(),'First')]
${Vue_Select_SecondOp}  //a[contains(text(),'Second')]

${React_Select_Main}  //div[text()='Select Country']
${React_Select_Algeria}  //span[text()='Algeria']
${React_Select_SelectedAlgeria}  //div[text()='Algeria']
${React_Select_Belize}  //span[text()='Belize']
${React_Select_SelectedBelize}  //div[text()='Belize']
${React_Select_AS}  //span[text()='American Samoa']
${React_Select_SelectedAS}  //div[text()='American Samoa']


*** Test Cases ***
TC01 - Default Dropdown
    Log To Console    S1:Open https://rode.com/en/support/where-to-buy
    Open Browser  ${url_tc1}  ${browser}
    Set Selenium Implicit Wait    30

    Log To Console    S2:Select “Vietnam” option on the dropdown list
    Select From List By Value    ${Rode_Droplis_Main}  Vietnam

    Log To Console    S3:Verify “Vietnam” is selected
    ${checked_value}=  Get Selected List Value    ${Rode_Droplis_Main}
    Should Be Equal    ${checked_value}    Vietnam

    Log To Console    S4:Click on Search button
    Click Button    ${Rode_Button_Search}

    Log To Console    S5:Get the number of dealers
    ${checked_count_dealers}=  Get Element Count    ${Rode_List_Dealers}

    Log To Console    S6:Verify the number of deadlier is 2461?
    Should Be Equal  ${checked_count_dealers}  ${82}

    Close Browser

TC02 - Custom Dropdown - React + APM => Not yet
    Log To Console    S1: Open https://demoqa.com/forms
        Open Browser  ${url_tc2}  ${browser}
        Maximize Browser Window
        Click Element    ${Demoqa_Span_Form}

    Log To Console    S2: Nhập toàn bộ thông tin vào form
        Input Text  ${Demoqa_Textbox_FirstName}  Pham
        Input Text  ${Demoqa_Textbox_LastName}  Khanh
        Input Text  ${Demoqa_Textbox_Email}  phamkhanh@gmail.com
        #Select Radio Button  gender  Male
        Input Text  ${Demoqa_Textbox_Number}  0337409826
        Input Text  ${Demoqa_Textbox_Date}  07 April 1998
        #Input Text  ${Demoqa_Textbox_Subject}  English
        Press Keys  ${Demoqa_Textbox_Subject}  ENTER
        Select Checkbox    ${Demoqa_Checkbox_Sports}
        Choose File  ${Demoqa_UploadFile_Picture}  C:\Users\xghus\OneDrive\Pictures\3.jpg
        Input Text    ${Demoqa_TextArea_Address}  Tay Ho, Ha Noi
        Select From List By Label    ${Demoqa_Select_State_NCR}
        Select From List By Label    ${Demoqa_Select_City_Delhi}
        Click Button    ${Demoqa_Button_Submit}


TC03 - Custom Dropdown - JQuery
    Log To Console    S1: Open https://jqueryui.com/resources/demos/selectmenu/default.html
    Open Browser  ${url_tc3}  ${browser}
    
    Log To Console    S2: Select speed = Faster
    Click Element  ${Jquery_Select_Speed}
    Click Element  ${Jquery_Select_Fast}

    Log To Console    S3: Verify dropdown is selected by “Faster” value
    ${checked_speed}=  Get Text  //span[@id='speed-button']//span[text()='Faster']
    Should Be Equal  ${checked_speed}  Faster

    Log To Console    S4: Select File = jQuery.js
    Click Element  ${Jquery_Select_File}
    Click Element  ${Jquery_Select_jQuery}

    Log To Console    S5: Verify File is selected by “jQuery.js” value
    ${checked_file}=  Get Text  //span[@id='files-button']//span[text()='jQuery.js']
    Should Be Equal  ${checked_file}  jQuery.js

    Log To Console    S6: Select number is 7
    Click Element  ${Jquery_Select_Number}
    Click Element  ${Jquery_Select_7}

    Log To Console    S7: Verify number is selected by 7
    ${verify_number_jquery}=  Convert To String  ${Jquery_Select_a_number}
    ${checked_number}=  Get Text  //span[@id='number-button']//span[number()='7']
    Should Be Equal  ${checked_number}  ${verify_number_jquery}

    Log To Console    S8: Select title is Mrs.
    Click Element  ${Jquery_Select_Title}
    Click Element  ${Jquery_Select_Mrs}

    Log To Console    S9: Verify title is selected by Mrs.
    ${checked_title}=  Get Text  //span[@id='salutation-button']//span[text()='Mrs.']
    Should Be Equal  ${checked_title}  Mrs.

    Close Browser

TC04 - Custom Dropdown - ReactJS
    Log To Console    S1: Open https://react.semantic-ui.com/maximize/dropdown-example-selection/
    Open Browser  ${url_tc4}  ${browser}
        
    Log To Console    S2: Select “Elliot Fu” option
    Click Element    ${ReactJS_Select_Main}
    Click Element    ${ReactJS_Select_EF}
        
    Log To Console    S3: Verify “Elliot Fu” is selected successfully
    ${checked_ef}=  Get Text    ${ReactJS_Select_Verify}
    Should Be Equal    ${checked_ef}    Elliot Fu
        
    Log To Console    S4: Select “Stevie Feliciano” option
    Click Element    ${ReactJS_Select_SelectedEF}
    Click Element    ${ReactJS_Select_SF}

    Log To Console    S5: Verify “Stevie Feliciano” is selected successfully
    ${checked_sf}=  Get Text    ${ReactJS_Select_Verify}
    Should Be Equal    ${checked_sf}    Stevie Feliciano

    Log To Console    S6: Select “Justen Kitsune” option
    Click Element    ${ReactJS_Select_SelectedSF}
    Click Element    ${ReactJS_Select_JK}

    Log To Console    S7: Verify “Justen Kitsune” is selected successfully
    ${checked_jk}=  Get Text    ${ReactJS_Select_Verify}
    Should Be Equal    ${checked_jk}    Justen Kitsune

    Close Browser

TC05 - Custom Dropdown - VueJS
    Log To Console    S1: Open https://mikerodham.github.io/vue-dropdowns/
    Open Browser  ${url_tc5}  ${browser}
        
    Log To Console    S2: Select “Second Option” option
    Click Element    ${Vue_Select_Items}
    Click Element    ${Vue_Select_SecondOp}
        
    Log To Console    S3: Verify “Second Option” is selected successfully
    ${checked_second}=  Get Text    ${Vue_Select_Items}
    Should Be Equal    ${checked_second}    Second Option
        
    Log To Console    S4: Select “First Option” option
    Click Element    ${Vue_Select_Items}
    Click Element    ${Vue_Select_FirstOp}

    Log To Console    S5: Verify “First Option” is selected successfully
    ${checked_first}=  Get Text    ${Vue_Select_Items}
    Should Be Equal    ${checked_first}    First Option

    Close Browser

TC06 - Editable Custom Dropdown
    Log To Console    S1: Open https://react.semantic-ui.com/maximize/dropdown-example-search-selection/
    Open Browser  ${url_tc6}  ${browser}
        
    Log To Console    S2: Enter and select “Algeria” option
    Click Element    ${React_Select_Main}
    Click Element    ${React_Select_Algeria}
        
    Log To Console    S3: Verify “Algeria” is selected
    ${checked_Algeria}  Get Text    ${React_Select_SelectedAlgeria}
    Should Be Equal    ${checked_Algeria}    Algeria
        
    Log To Console    S4: Enter and select “Belize” option
    Click Element    ${React_Select_SelectedAlgeria}
    Click Element    ${React_Select_Belize}

    Log To Console    S5: Verify “Belize” is selected
    ${checked_Belize}  Get Text    ${React_Select_SelectedBelize}
    Should Be Equal    ${checked_Belize}    Belize

    Log To Console    S6: Enter and select “American Samoa” option
    Click Element    ${React_Select_SelectedBelize}
    Click Element    ${React_Select_AS}

    Log To Console    S7: Verify “American Samoa” is selected
    ${checked_AS}  Get Text    ${React_Select_SelectedAS}
    Should Be Equal    ${checked_AS}    American Samoa

    Close Browser
*** Keywords ***

