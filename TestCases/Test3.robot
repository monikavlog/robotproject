*** Settings ***
Library    SeleniumLibrary
Test Setup    start and maximize browser
Test Teardown    close browser window

*** Variables ***
${url}    https://validation.ameyo.com:8443/app
${browser}    chrome

*** Keywords ***
start and maximize browser
    open browser    ${url}    ${browser}
    maximize browser window
    ${implicit wait}    get selenium implicit wait
    log to console    ${implicit wait}
    set selenium implicit wait    30
    ${implicit wait after set}    get selenium implicit wait
    log to console    ${implicit wait after set}

close browser window
    ${title}    get title
    log to console    ${title}
    close browser


*** Test Cases ***
Login Agent
    [Documentation]    Login page of ECC
    [Tags]    smoke
    input text    xpath://input[@automationid="enterLoginUsername"]    Austin
    input text    xpath://input[@automationid="enterLoginPassword"]    Austin
    click element    xpath://button[@automationid="loginButton"]
    sleep    20

Agent Force Login
    [Documentation]    Force Login
    [Tags]    smoke
    input text    xpath://input[@automationid="enterLoginUsername"]    Austin
    input text    xpath://input[@automationid="enterLoginPassword"]    Austin
    click element    xpath://button[@automationid="loginButton"]
    click element    xpath://button[@automationid="confirmationBtn1"]


Agent Work Mode Selection
    [Documentation]    work mode selection
    [Tags]    smoke
    input text    xpath://input[@automationid="enterLoginUsername"]    Austin
    input text    xpath://input[@automationid="enterLoginPassword"]    Austin
    click element    xpath://button[@automationid="loginButton"]
    click element    xpath://button[@automationid="confirmationBtn1"]
    click element    xpath://input[@name="workingMode"]/following-sibling::label    work from office
    click element    xpath://button[span[text()="Next"]]
    sleep    10
