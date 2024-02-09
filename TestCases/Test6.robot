*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://validation.ameyo.com:8443/app
${browser}    chrome

*** Test Cases ***
Demo Test 1
    open browser    ${url}    ${browser}
    set selenium implicit wait    20
    input text    xpath://input[@automationid="enterLoginUsername"]    mona1
    input text    xpath://input[@automationid="enterLoginPassword"]    mona1
    click element    xpath://button[@automationid="loginButton"]
    sleep    15
    handle alert    accept
    handle alert    dismiss
    alert should be present    press button