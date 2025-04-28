*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library    Process

*** Variables ***

*** Test Cases ***
Append To Environment Variable
    ${current_path}=    Get Environment Variable    PATH
    Log    Path Before: ${current_path}

    Append To Environment Variable    PATH    C:\\MyCustomPath

    ${new_path}=    Get Environment Variable    PATH
    Log    Path After: ${new_path}

Append To File
    ${file_path}=    Set Variable    log_example.txt
    Append To File    ${file_path}    This is the first log line.
    Append To File    ${file_path}    This is the second log line.
    Log File    ${file_path}

Copy File
    ${src}=    Set Variable    data.txt
    ${dst}=    Set Variable    data_backup.txt
    Copy File    ${src}    ${dst}
    Should Exist    ${dst}

Create File
    Create File    demo.txt    Xin chào Robot Framework!

    ${noi_dung}=    Get File    demo.txt
    Should Contain    ${noi_dung}    Robot Framework

Directory Should Be Empty
    Create Directory    output_folder
    Directory Should Be Empty    output_folder

Directory Should Exist
    Create Directory    output/logs
    Directory Should Exist    output/logs

Directory Should Not Be Empty
    Create Directory    output
    Create File         output/test.txt
    Directory Should Not Be Empty    output

Directory Should Not Exist
    Remove Directory  output
    Directory Should Not Exist    output


Empty Directory
    Create Directory    my_folder
    Create File         my_folder/file1.txt
    Create File         my_folder/file2.txt
    Empty Directory     my_folder
    Directory Should Be Empty    my_folder

Environment Variable Should Be Set
    Set Environment Variable    MY_VAR    Hello
    Environment Variable Should Be Set    MY_VAR

Environment Variable Should Not Be Set
    Environment Variable Should Not Be Set    API_KEY

File Should Be Empty
    Create File    my_test.txt
    File Should Be Empty    my_test.txt

File Should Exist
    Create File    my_test.txt
    File Should Exist    my_test.txt

File Should Not Be Empty
    Create File    output.log    Hello World
    File Should Not Be Empty    output.log

Get Environment Variable
    ${my_var_value} =  Get Environment Variable    MY_VAR    Hello World
    Log  ${my_var_value}

Get File
    Create File    demo/demo.txt  Hello World
    ${get_file} =  Get File    demo/demo.txt
    Log    ${get_file}

Get File Size
    Create File    demo/demo.txt  Hello World
    ${get_file_size} =  Get File Size    demo/demo.txt
    Log    ${get_file_size}

Get Modified Time
    ${modified_time} =    Get Modified Time    demo.txt
    Log    ${modified_time}

Grep File
    ${lines} =    Grep File    demo/demo.txt    Hello
    Log    ${lines}

Join Path
    ${path} =  Join Path  my  path  file.txt
    Log    ${path}

Join Paths
    ${path} =    Join Paths    folder1    folder2    file.txt
    Log    ${path}

List Directories In Directory
    ${directories} =    List Directories In Directory    TestSuite/
    Log    ${directories}

List Directory
    ${files_and_dirs} =    List Directory    TestSuite/
    Log    ${files_and_dirs}

List Files In Directory
    ${files} =    List Files In Directory    TestSuite/Homework/
    Log    ${files}

Log Environment Variables
    Log Environment Variables

Log File
    Create File    demo/demo.txt  Hello World
    Log File    demo/demo.txt

Move Directory
    Create Directory    old_folder
    Create Directory    new_folder
    Move Directory    old_folder    new_folder
    Directory Should Exist    new_folder/old_folder
    #Báo lỗi nếu file ko tồn tại

Move File
    Create File    file_1/demo.txt  1
    Create File    file_2/demo.txt  2
    Move File    file_1/demo.txt    file_2
    File Should Exist    file_2/demo.txt

Normalize Path
    Log    Không biết cho ví dụ

Remove File
    Create File    file_1/demo.txt
    Remove File    file_1/demo.txt
    File Should Not Exist  file_1/demo.txt

Run
    ${output} =    Run    echo Hello Robot
    Log    ${output}

Run And Return Rc
    ${output} =    Run Process    	python  -c  print('Hello, world!')
    Log    ${output}

Run And Return Rc And Output
    ${output} =    Run And Return Rc And Output    echo Hello Robot
    Log    ${output}

Should Exist
    Create File    example.txt    Hello Robot
    Should Exist    example.txt

Should Not Exist
    Create File    temp.txt    Sample Text
    Remove File    temp.txt
    Should Not Exist    temp.txt

Split Extension
    Create File    /home/user/example.txt
    ${name}    ${ext} =    Split Extension    /home/user/example.txt
    Log    File Name: ${name}
    Log    File Extension: ${ext}


    Remove File    /home/user/example.txt

Touch
    ${before_modified_time} =    Get Modified Time    ${EXECDIR}/demo/demo.txt
    Log  ${before_modified_time}
    Touch    ${EXECDIR}/demo/demo.txt
    ${after_modified_time} =    Get Modified Time    ${EXECDIR}/demo/demo.txt
    Log    ${after_modified_time}


Wait Until Created
    Create File    /tmp/test_file.txt
    Wait Until Created    /tmp/test_file.txt    10
    Should Exist    /tmp/test_file.txt

Wait Until Removed
    Create File     /tmp/test_file.txt
    Remove File    /tmp/test_file.txt
    Wait Until Removed    /tmp/test_file.txt    10
    Should Not Exist    /tmp/test_file.txt


*** Keywords ***

