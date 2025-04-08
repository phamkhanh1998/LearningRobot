*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn
Library  Collections
*** Variables ***
@{List}  Python  Java  CSharp
@{List2}  Golang  Cobol
&{acc1}  name=John  email=khanh  phone=023

*** Test Cases ***
Ex1: Append To List
    Append To List  ${List}  PHP
    Log  ${List}
Ex2: Combine Lists
    ${new_list} =  Combine Lists  ${List}  ${List2}
    Log  ${new_list}
Ex3: Convert To Dictionary
    ${create_list} =  Create List  a1    b2    c3
    ${dict}  Convert To Dictionary  ${create_list}
    Log  ${dict}
Ex4: Convert To List
    ${tuple} =  Create Dictionary  name=John  age=30  city=New York
    ${cv_list} =  Convert To List  ${tuple}
    Log  ${cv_list}
Ex5: Copy Dictionary
    ${create_list} =  Create List  a1    b2    c3
    ${dict} =  Convert To Dictionary  ${create_list}
    Log  ${dict}
    ${new_dict} =  Copy Dictionary  ${dict}
    Log  ${new_dict}
    #search deep copy agrument
Ex6: Copy List
    ${new_list} =  Copy List  ${List}
    Log  ${new_list}
    #search deep copy agrument
Ex7: Count Values In List
    ${my_list} =  Create List  Apple  Banana  Apple  Cherry  Apple
    ${count} =  Count Values In List  ${my_list}  Apple
    Log  ${count}
Ex8: Dictionaries Should Be Equal
    ${dict1} =  Create Dictionary  name=John  age=30  city=New York
    ${dict2} =  Create Dictionary  name=John  age=30  city=New York
    Dictionaries Should Be Equal  ${dict1}  ${dict2}
    #search ignor value order
Ex9: Dictionary Should Contain Item
    ${my_dict} =  Create Dictionary  name=John  age=30  city=New York
    Dictionary Should Contain Item  ${my_dict}  age  30
    Dictionary Should Contain Item  ${my_dict}  name  John
    #search message, ignor key
Ex10: Dictionary Should Contain Key
    ${my_dict} =  Create Dictionary  name=John  age=30  city=New York
    Dictionary Should Contain Key  ${my_dict}  age
    Dictionary Should Contain Key  ${my_dict}  city
    #search message, ignor key
Ex11: Dictionary Should Contain Sub Dictionary
    ${parent_dict} =  Create Dictionary  name=John  age=30  city=New York  country=USA
    ${sub_dict} =  Create Dictionary  name=John  city=New York
    Dictionary Should Contain Sub Dictionary  ${parent_dict}  ${sub_dict}
Ex12: Dictionary Should Contain Value
    ${my_dict} =  Create Dictionary  name=John  age=30  city=New York
    Dictionary Should Contain Value  ${my_dict}  John
    #Dictionary Should Contain Value  ${my_dict}  john  ignore_case=True
    Dictionary Should Contain Value  ${my_dict}  30
    #search message, ignor key
Ex13: Dictionary Should Not Contain Key
    ${my_dict} =  Create Dictionary  name=John  age=30  city=New York
    Dictionary Should Not Contain Key  ${my_dict}  country
    #Dictionary Should Not Contain Key  ${my_dict}  AGE  ignore_case=True  msg="Error 404"
Ex14: Dictionary Should Not Contain Value
    ${my_dict} =  Create Dictionary  name=John  age=30  city=New York
    Dictionary Should Not Contain Key  ${my_dict}  Khanh
    #Dictionary Should Not Contain Key  ${my_dict}  AGE  ignore_case=True  msg="Error 404"
Ex15: Get Dictionary Items
    ${my_dict} =  Create Dictionary  name=John  age=30  city=New York
    ${items} =  Get Dictionary Items  ${my_dict}
    Log  Các mục trong dictionary: ${items}
    #sort key
Ex16: Get Dictionary Keys
    ${my_dict} =  Create Dictionary  name=John  age=30  city=New York
    ${keys} =  Get Dictionary Keys  ${my_dict}
    Log  Danh sách key: ${keys}
    #sort key
Ex17: Get From Dictionary
    ${my_dict} =  Create Dictionary  name=John  age=30  city=New York
    ${value} =  Get From Dictionary  ${my_dict}  city
    Log  Giá trị lấy được: ${value}
    #Log  ${my_dict}[city]
Ex18: Get From List
    ${my_list} =  Create List  Python  Java  CSharp
    ${value} =  Get From List  ${my_list}  1
    Log  ${value}
Ex19: Get Index From List
    ${my_list} =  Create List  Python  Java  CSharp  Java
    ${index} =  Get Index From List  ${my_list}  Java
    Log  Vị trí của 'Java' trong danh sách là: ${index}
Ex20: Get Match Count
    ${my_list} =  Create List  Python  Java  CSharp  Java  Golang  Jupiter
    ${count} =  Get Match Count  ${my_list}  J*
    Log  ${count}
    #search regular expression
Ex21: Get Matches
    ${my_list} =  Create List  Python  Java  CSharp  Java  Golang  Javascript  JUnit
    ${matches} =  Get Matches  ${my_list}  J*
    Log  ${matches}
Ex22: Get Slice From List
    ${my_list} =  Create List  Python  Java  CSharp  Golang  Cobol  Javascript
    ${slice} =  Get Slice From List  ${my_list}  1  4
    Log  ${slice}
Ex23: Insert Into List
    ${my_list} =  Create List  Python  Java  CSharp
    Insert Into List  ${my_list}  1  PHP
    Log  ${my_list}
Ex24: Keep In Dictionary
    ${my_dict} =  Create Dictionary  name=Alice  age=25  city=Paris  country=France
    Keep In Dictionary  ${my_dict}  name  city
    Log  ${my_dict}
Ex25: List Should Contain Sub List
    ${main_list} =  Create List  Python  Java  CSharp  Golang  Cobol  Javascript
    ${sub_list} =  Create List  Python  Java
    List Should Contain Sub List  ${main_list}  ${sub_list}
Ex26: List Should Contain Value
    ${my_list} =  Create List  Python  Java  CSharp  Golang  Cobol  Javascript
    List Should Contain Value  ${my_list}  Cobol
Ex27: Lists Should Be Equal
    ${list1}=    Create List    A    B    C
    ${list2}=    Create List    A    B    C
    Lists Should Be Equal    ${list1}    ${list2}

Ex28: Log Dictionary
    Log Dictionary    ${acc1}

Ex29: Log List
    Log List  ${List}

Ex30: Pop From Dictionary
    ${user}=    Create Dictionary    name=Alice    age=25    city=Hanoi
    ${age}=     Pop From Dictionary    ${user}    age
    Log    Đã xóa 'age', giá trị lấy được là: ${age}
    Log Dictionary    ${user}

Ex31: Remove Duplicates
    ${mylist}=     Create List    A    B    A    C    B    D
    ${unique}=     Remove Duplicates    ${mylist}
    Log List       ${unique}
Ex32: Remove From Dictionary
    ${info}=    Create Dictionary    name=Hana    age=22    city=Hanoi    country=Vietnam
    Remove From Dictionary    ${info}    age    city
    Log Dictionary    ${info}

Ex33: Remove From List
    ${fruits}=    Create List    Apple    Banana    Cherry    Durian
    Remove From List    ${fruits}    2
    Log List    ${fruits}

Ex34: Remove Values From List
    ${my_list}=    Create List    Python  PHP  Java  CSharp
    Remove Values From List    ${my_list}    PHP
    Log List    ${my_list}

Ex35: Reverse List
    ${numbers}=    Create List    1    2    3    4    5
    Reverse List    ${numbers}
    Log List        ${numbers}

Ex36: Set List Value
    ${mylist}=        Create List    Python  PHP  Java  CSharp
    Set List Value    ${mylist}     1    Golang
    Log List          ${mylist}

Ex37: Set To Dictionary
    ${info}=    Create Dictionary    name=Hana    age=25
    Set To Dictionary    ${info}    city=Hanoi    age=26
    Log Dictionary       ${info}

Ex38: Should Contain Match
    ${text}=    Set Variable    Hello, welcome to the Robot Framework!
    Should Contain Match    ${text}    Robot

Ex39: Should Not Contain Match
    ${text}=    Set Variable    Hello, welcome to the Robot Framework!
    Should Not Contain Match    ${text}    Python

Ex40: Sort List
    ${numbers}=    Create List    5    3    8    1    9
    Sort List    ${numbers}
    Log List    ${numbers}

Ex41: List Should Not Contain Duplicates
    ${fruits}=    Create List    Apple    Banana    Cherry    Apple
    List Should Not Contain Duplicates    ${fruits}

Ex42: List Should Not Contain Value
    ${fruits}=    Create List    Apple    Banana    Cherry
    List Should Not Contain Value    ${fruits}    Orange

Ex43: Get Dictionary Values
    ${my_dict}=    Create Dictionary    name=John    age=30    city=New York
    ${values}=    Get Dictionary Values    ${my_dict}
    Log List    ${values}
*** Keywords ***