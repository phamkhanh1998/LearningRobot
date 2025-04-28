*** Settings ***
Library  SeleniumLibrary
Library  DateTime
*** Variables ***

*** Test Cases ***
Add Time To Date
    Log To Console  Add Day
    ${now}=    Get Current Date    result_format=%Y-%m-%d %H:%M:%S
    ${new_time}=    Add Time To Date    ${now}    1 day 2 hours
    Log    ${new_time}

    Log To Console  Add Hour
    ${result}=    Add Time To Date    2025-04-05 10:30:00    2 hours 15 minutes
    Log    ${result}

Add Time To Time
    ${time}=    Set Variable    08:00:00
    Log    ${new_time}

Convert Date Format
    Log    ${converted}

Convert Time Format
    Log    ${converted}
    #Fail

Get Current Date
    Log    ${today}

Subtract Dates
    Log    ${diff}

Subtract Time From Date
    ${new_date}=    Subtract Time From Date    2025-04-05 15:00:00    2 hours    result_format=%Y-%m-%d %H:%M:%S
    Log    ${new_date}

Subtract Time From Time
    Log    ${new_time}
*** Keywords ***