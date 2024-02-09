*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Assert Demo Test Case 1
    ${x}    set variable    hello
    ${y}    set variable    hello
    should be equal    ${x}    ${y}

Assert Demo Test Case 2
    ${x}    set variable    hello
    ${y}    set variable    hello1
    should not be equal    ${x}    ${y}

Assert Demo Test Case 3
    ${x}    set variable    hello
    ${y}    set variable    hello1
    should contain    ${y}    ${x}

Assert Demo Test Case 4
    ${x}    set variable    hello
    ${y}    set variable    hello1
    should contain    ${x}    he