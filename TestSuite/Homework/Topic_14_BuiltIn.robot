*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn

*** Variables ***
${tên}    Robot
@{danh_sách}    A    B    C


*** Test Cases ***
Call Method
    Log To Console    Chưa làm

Catenate
    ${result}=    Catenate  SEPARATOR=${EMPTY}    Hello    world!
    Log    ${result}
    #dùng nhiều
Continue For Loop
    FOR    ${i}    IN RANGE    1  6
        Run Keyword If    ${i} % 2 != 0    Continue For Loop
        Log  ${i}
    END

Continue For Loop If
    FOR    ${i}    IN RANGE    1    6
        Continue For Loop If    ${i} % 2 != 0
        Log  ${i}
    END

Convert To Binary
    ${result}    Convert To Binary    15
    Log    ${result}

Convert To Boolean
    ${val1}    Convert To Boolean    True
    Log    ${val1}  # True
    Should Be Equal    ${val1}    ${True}

Convert To Bytes
    ${bytes_val}    Convert To Bytes    Xin chào
    Log    ${bytes_val}

Convert To Hex
    ${hex_val}    Convert To Hex    255
    Log    ${hex_val}

Convert To Integer
    ${int1}    Convert To Integer    0b110
    Log    ${int1}    # 123

Convert To Number
    ${num1}    Convert To Number    47.512  -1
    Log    ${num1}

Convert To Octal
    ${octal_val}    Convert To Octal    64
    Log    ${octal_val}

Convert To String
    ${val1}    Convert To String    ${123}
    Log    ${val1}    # "123"
    Should Be Equal    ${val1}    ${123}

Evaluate
    ${kq1}    Evaluate    5 + 3
    Log    ${kq1}    # 8

Exit For Loop
    FOR    ${i}    IN RANGE    0    10
        Log    ${i}
        Run Keyword If    '${i}' == '5'    Exit For Loop
    END

Exit For Loop If
    FOR    ${i}    IN RANGE    0    10
        Log    Giá trị hiện tại: ${i}
        Exit For Loop If    ${i} == 4
    END

Fail
    ${x}    Set Variable    5
    Run Keyword If    ${x} < 10    Fail    Vì 5 < 10 nên t đánh nó Fail -> Ngưng test
    Log    Đây sẽ không được in ra nếu bị Fail phía trên

Fatal Error
    ${giá_trị}    Set Variable    0
    Run Keyword If    ${giá_trị} == 0    Fatal Error    Dừng hệ thống vì giá trị bằng 0!
    Log    Dòng này sẽ không bao giờ được in

Get Library Instance
    ${lib}    Get Library Instance    MyLibrary
    ${msg}    Call Method    ${lib}    hello    Robot
    Log    ${msg}

Get Variable Value
    ${kết_quả}    Get Variable Value    ${tên}
    Log    ${kết_quả}

    ${giá_trị}    Get Variable Value    ${không_tồn_tại}    Mặc định!
    Log    ${giá_trị}

Get Variable
    ${biến}    Get Variables
    Log    ${biến}

Import Thư Viện
    Import Library    Collections
    ${list}    Create List    A    B
    Append To List    ${list}    C
    Log    ${list}

Import Resource
    No Operation
    Log To Console    Chưa làm ược
Import Variables
    No Operation
    Log To Console    Chưa làm ược
Keyword Should Exist
    Keyword Should Exist    BuiltIn.Log

Check List Length
    ${mylist}=    Create List    a    b    c
    Length Should Be    ${mylist}    4

Log Many
    Log Many    Xin chào    Robot    Framework    2025

Log Variables
    ${name}=     Set Variable    Robot
    @{fruits}=   Create List     Cam    Tao
    &{info}=     Create Dictionary    age=5    lang=Python
    Log Variables

Pass Execution
    ${x} =  Set Variable  100
    Run Keyword If    ${x} < 10    Pass Execution  Cái này 5 < 10 nên t log ra nó
    Log  Cái này sẽ log ra nếu thawng trên FAIl

Pass Execution If
    ${x} =  Set Variable  100
    Pass Execution If    ${x} < 10    Cái này 5 < 10 nên t log ra nó
    Log  Cái này sẽ log ra nếu thawng trên FAIl

Run Keyword
    Run Keyword    Log    Hello từ Run Keyword!

#------------------------- đều giôn nhau là có đầu vào là keywork, gặp lỗi tiếp tục chạy
Run Keyword And Continue On Failure
    Run Keyword And Continue On Failure    Should Be Equal    1    2
    Log    Test vẫn tiếp tục dù ở trên bị lỗi
    # báo fail nhưng vẫn chạy, fail vẫn tính vào kết quả test case
Run Keyword And Ignore Error
    Run Keyword And Ignore Error    Should Be Equal    1    2
    Log    Test vẫn tiếp tục dù ở trên bị lỗi
    # báo fail nhưng vẫn chạy, fail nhưng ko tính vào kết quả test case
Run Keyword And Warn On Failure
    Run Keyword And Warn On Failure    Fail    Đây là lỗi
    Log    Tiếp tục thực thi các bước sau
    # báo fail nhưng vẫn chạy, fail nhưng ko tính vào kết quả test case, có warning message
#-------------------------

Run Keyword And Expect Error
    Run Keyword And Expect Error    Element not found    Should Be Equal    1    2
    Log    Lỗi như mong đợi, test tiếp tục

Run Keyword And Return
    ${kq}=    Run Keyword And Return    Set Variable    Hello Robot
    Log    Kết quả: ${kq}
    #chua dc
    # tự custom keywork
Run Keyword And Return If
    ${result}=    Run Keyword And Return If    ${True}    Set Variable    Điều kiện đúng
    Log    Kết quả: ${result}
    #chua dc
    # tự custom keywork
Run Keyword And Return Status
    ${status}=    Run Keyword And Return Status    Should Be Equal    1    2
    Log    Trạng thái: ${status}

Run Keyword If
    ${x}=    Set Variable    2
    Run Keyword If    ${x} > 3    Log    ${x} is greater than 3  ELSE  Log  ${x} is less than 3

Run Keyword If All Tests Passed
    Log  chưa bik làm
Run Keyword If Any Tests Failed
    Log  chưa bik làm
Run Keyword If Test Failed
    Log  chưa bik làm
Run Keyword If Test Passed
    Log  chưa bik làm
Run Keyword If Timeout Occurred
    Log  chỉ dùng trong test teardown

Run Keyword Unless
    ${result}=    Set Variable If    ${1} == ${1}    True    False
    Run Keyword Unless    '${result}' == 'True'    Log    Condition is False, running cleanup.

Should Be Empty
    [Documentation]    This test case checks if the string is empty.
    ${my_string}=    Set Variable    ${EMPTY}
    Should Be Empty    ${my_string}

Should Be Equal As Integers
    Should Be Equal As Integers    123    123

Should Be Equal As Numbers
    Should Be Equal As Numbers    10    ${10}

Should Be Equal As Strings
    Should Be Equal As Strings    123    ${123}

Should Be True
    Should Be True    False

Should Contain
    Should Contain    Hello World    World

Should Contain Any
    Should Contain Any    Hello World    World    Goodbye
Should Contain X Times
    Should Contain X Times    Hello Robot, welcome to Robot world!    Robot    3
Should End With
    Should End With    Hello, world!    world!
Should Not Match
    Should Not Match    Hello World    Goodbye*

Should Not Match Regexp
    Should Not Match Regexp    abc123    ^xyz
    #https://regexr.com/
Should Not Start With
    Should Not Start With    Robot Framework    Hello

Should Start With
    Should Start With    Hello Robot Framework    Hello

*** Keywords ***
