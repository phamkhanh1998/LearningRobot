*** Settings ***
Library  SeleniumLibrary
Library  Process

*** Variables ***


*** Test Cases ***
Get Process Id
    Log To Console    Không hiểu

Get Process Object
    Log To Console    Không hiểu

Get Process Result
    Log To Console    Không hiểu

Is Process Running
    ${is_running}=    Is Process Running    python
    Run Keyword If    ${is_running}    Log    Python is running!
    Run Keyword If    not ${is_running}    Log    Python is not running!

Join Command Line
    ${cmd}=    Join Command Line    python    script.py    --arg1    value1    --arg2    value2
    Log    Command: ${cmd}

Process Should Be Running
    Process Should Be Running    python

Process Should Be Stopped
    Process Should Be Stopped    python

Send Signal To Process
    Log To Console    Không hiểu

Split Command Line
    ${args}=    Split Command Line    python my_script.py --arg1 value1
    Log Many    ${args}

Start Process
    ${pid}=    Start Process    notepad.exe
    Log    Notepad started with PID: ${pid}

Switch Process
    Log To Console    Không hiểu

Terminate Processes
    Start Process    notepad.exe
    Start Process    calc.exe
    Sleep    3s
    Terminate All Processes

Terminate Process
    ${pid}=    Start Process    notepad.exe
    Sleep    2s
    Terminate Process    ${pid}

Wait For Process
    ${pid}=    Start Process    ping    127.0.0.1    -n    3
    ${rc}=     Wait For Process    ${pid}
    Should Be Equal As Integers    ${rc}    0

*** Keywords ***