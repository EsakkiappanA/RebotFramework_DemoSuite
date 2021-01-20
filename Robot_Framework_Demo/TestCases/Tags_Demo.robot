*** Settings ***
Library    BuiltIn    

*** Variables ***
${a}=    10
${b}=    5    

*** Test Cases ***
Adding Two numbers
    [Documentation]    Addition
    [Tags]    Add    Sub
    Add two num    ${a}    ${b}
    

Subtracting Two numbers
    [Documentation]    Subtraction
    [Tags]    Sub
    Sub two num    ${a}    ${b}
    

Multiplying Two numbers
    [Documentation]    Multiplication
    [Tags]    Mul
    Multi two num    ${a}    ${b}
    

Dividing Two numbers
    [Documentation]    Division
    [Tags]    Div
    Divide two num    ${a}    ${b}
   

*** Keywords ***
Add two num
    [Arguments]    ${num1}    ${num2}
    ${result}=    Evaluate  ${num1}+${num2}
    Log    ${result}     
    

Sub two num
    [Arguments]    ${num1}    ${num2}
    ${result}=    Evaluate    ${num1} - ${num2}
    Log    ${result}
   

Multi two num
    [Arguments]    ${num1}    ${num2}
    ${result}=    Evaluate    ${num1} * ${num2}
    Log    ${result}    
    

Divide two num
    [Arguments]    ${num1}    ${num2}
    ${result}=    Evaluate    ${num1} / ${num2}
    Log    ${result}