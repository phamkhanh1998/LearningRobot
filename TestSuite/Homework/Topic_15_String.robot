*** Settings ***
Library  SeleniumLibrary
Library  String
Library  BuiltIn
Library    DateTime
Library    OperatingSystem

*** Variables ***


*** Test Cases ***
Convert To Lower Case
    ${str1} =  Convert To Lower Case  ABC
    Log  ${str1}

Convert To Title Case
    ${str1} =  Convert To Title Case  hello world!!!
    Log  ${str1}

Convert To Upper Case
    ${str1} =  Convert To Upper Case   ABC
    Log  ${str1}

Decode Bytes To String
    ${bytes}=    Evaluate    b'Chao ban!'
    ${text}=  Decode Bytes To String  ${bytes}  encoding=UTF-8
    Log    ${text}

Encode String To Bytes
    ${text}=     Set Variable    Hello world
    ${bytes}=    Encode String To Bytes    ${text}  encoding=UTF-8
    ${decoded}=  Decode Bytes To String    ${bytes}  encoding=UTF-8
    Should Be Equal    ${text}    ${decoded}

Fetch From Left
    ${result}=    Fetch From Left    email@example.com    @
    Log    ${result}

Fetch From Right
    ${result}=    Fetch From Right    email@example.com    @
    Log    ${result}

Format String
    ${result}=    Format String    Hello, {name}! Today is {date}.Hello, {name}! Today is {date}.  name=John    date=Monday
    Log    ${result}
    # dùng nhieuef

Generate Random String
    ${random}=    Generate Random String    10    [LETTERS][NUMBERS]
    ${base_gmail}=  Set Variable  khanhpham{randomstring}@gmail.com
    ${current_date}=  Get Current Date  result_format=%Y%m%d%H%M%S
    ${gmail}=  Format String    ${base_gmail}  randomstring=${current_date}
    Log    ${gmail}
    #

Get Line
    ${text}=    Set Variable    Line 1\nLine 2\nLine 3
    ${line2}=   Get Line        ${text}    2
    Log         ${line2}

Get Line Count
    ${text}=    Catenate    SEPARATOR=\n    Line 1    Line 2    Line 3
    ${count}=   Get Line Count    ${text}
    Log    Số dòng là: ${count}

Get Lines Containing String
    ${text}=    Catenate    SEPARATOR=\n
    ...    Robot is cool
    ...    Python is powerful
    ...    I like Robot Framework
    ${result}=    Get Lines Containing String    ${text}    Robot
    Log    ${result}

Get Lines Matching Pattern
    ${text}=    Catenate    SEPARATOR=\n
    ...    Robot is awesome
    ...    Python is powerful
    ...    I like Robot Framework
    ${result}=    Get Lines Matching Pattern    ${text}    Robot*
    Log    ${result}
    # chưa dc

Get Lines Matching Regexp
     ${text}=    Catenate    SEPARATOR=\n
    ...    Robot is awesome
    ...    Python is powerful
    ...    I like Robot Framework
    ${result}=    Get Lines Matching Regexp    ${text}    Robot.*
    Log    ${result}

Get Regexp Matches
    ${text}=    Catenate    SEPARATOR=\n
    ...    Robot is awesome
    ...    Python is powerful
    ...    I like Robot Framework
    ${matches}=    Get Regexp Matches    ${text}    Robot
    Log    ${matches}

Get Substring
    ${result}=    Get Substring    Hello World!    0    5
    Log    ${result}

Remove String
    ${text}=    Set Variable    This is a Robot Framework example.
    ${result}=    Remove String    ${text}    Robot${SPACE}
    Log    ${result}

Remove String Using Regexp
    ${original}=    Set Variable    Hello 123 World 456
    ${result}=      Remove String Using Regexp    ${original}    World.*
    ${matches}=    Get Regexp Matches    ${original}    World.*
    Log             ${result}
    Log  ${matches}
    # chưa dc
    # remove 1 cai string

Replace String
    ${text}=        Set Variable    Xin chao Robot Framework
    ${result}=      Replace String    ${text}    Robot    Python
    Log             ${result}

Replace String Using Regexp
    ${text}=        Set Variable    Số điện thoại: 0987-654-321
    ${result}=      Replace String Using Regexp    ${text}    0987.*  111111
    Log  ${result}
    # chưa dc

Should Be Byte String
    ${bytes}=    Encode String To Bytes    Hello  UTF-8
    Should Be Byte String    ${bytes}


Test Lower Case
    ${text}=    Set Variable    hello world
    Should Be Lower Case    ${text}

Should Be String
    ${text}=    Set Variable    hello
    Should Be String    ${text}

Should Be Title Case
    ${text}=    Set Variable    Hello
    Should Be Title Case    ${text}

Should Be Unicode String
    ${text}=    Set Variable    Khanh
    Should Be Unicode String    ${text}

Should Be Upper Case
    ${text}=    Set Variable    hello world
    Should Be Upper Case    ${text}

Should Not Be String
    ${text}=    Set Variable    ${123}
    Should Not Be String    ${text}

Split String
    ${text}=    Set Variable    Xin: chào: các bạn
    ${list}=    Split String    ${text}   separator=:
    Log    ${list}

Split String From Right
    ${text}=    Set Variable    Một hai ba bốn năm
    ${result}=  Split String From Right    ${text}    ${SPACE}    2
    Log    ${result}

Split String To Characters
    ${text}=      Set Variable    Robot
    ${result}=    Split String To Characters    ${text}
    Log      ${result}

Split To Lines
    ${text}=    Set Variable    Đây là dòng 1.\nĐây là dòng 2.\nĐây là dòng 3.
    ${result}=  Split To Lines    ${text}
    Log   ${result}


Strip String
    ${text}=  Get File  C:${/}Users${/}xghus${/}PycharmProjects${/}demorobot${/}demo.txt
    ${replace}=  Replace String    ${text}    ${SPACE}${SPACE}    ${SPACE}
    Log  ${replace}



*** Keywords ***

