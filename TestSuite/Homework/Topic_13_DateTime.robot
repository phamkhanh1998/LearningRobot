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
    ${new_time}=    Add Time To Time    ${time}    2 hours
    Log    ${new_time}

Convert Date Format
    ${converted}=    Convert Date    05/04/2025    date_format=%d/%m/%Y    result_format=%Y-%m-%d
    Log    ${converted}

Convert Time Format
    ${converted}=    Convert Time    10:30 PM    time_format=%I:%M %p    result_format=%H:%M
    Log    ${converted}
    #Fail

Get Current Date
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    Log    ${today}

Subtract Dates
    ${diff}=    Subtract Date From Date    2025-04-10    2025-04-05
    Log    ${diff}

Subtract Time From Date
    ${new_date}=    Subtract Time From Date    2025-04-05 15:00:00    2 hours    result_format=%Y-%m-%d %H:%M:%S
    Log    ${new_date}

Subtract Time From Time
    ${new_time}=    Subtract Time From Time    15:00:00    2 hours
    Log    ${new_time}
*** Keywords ***