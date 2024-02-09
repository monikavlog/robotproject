*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/BaseKeywords.robot
Test Setup    start and maximize browser
Test Teardown    close browser window



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
