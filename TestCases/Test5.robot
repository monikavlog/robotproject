*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/BaseKeywords.robot
Resource    ../Resources/LoginPageKeywords.robot
Variables   ../Configs/test_config_data.py
Test Setup    start and maximize browser
Test Teardown    close browser window



*** Test Cases ***
Login Agent
    [Documentation]    Login page of ECC
    [Tags]    smoke12
    Login User    ${user_id}    ${user_password}
    sleep    20

Agent Force Login
    [Documentation]    Force Login
    [Tags]    smoke12
    Login User    ${user_id}    ${user_password}
    Force Login User


Agent Work Mode Selection
    [Documentation]    work mode selection
    [Tags]    smoke12
    Login User    ${user_id}    ${user_password}
    Force Login User
    Agent Work Mode Selection    ${user_work_mode}
    sleep    10

Agent Single Campaign Selection
    [Documentation]    Agent single Campaign selection task
    [Tags]    Smoke1
    Login User    ${user_id}    ${user_password}
    log to console    user login successfully
    Force Login User
    log to console    user force login successfully
    #Verify Welcome Message After Login Using Welcome Locator
    Verify Welcome Message After Login Using User_id
    Agent Work Mode Selection     ${user_work_mode}
    Agent Single Campaign Selection    ${campaign_select_by_user}
    log to console    Now searching campaign
    Agent Logout
    sleep    10

Agent MultiPle Campaign Selection
    [Documentation]    Agent MultiPle Campaign Selection
    [Tags]    Smoke12
    Login User    ${user_id}    ${user_password}
    log to console    user login successfully
    #Force Login User
    #log to console    user force login successfully
    #Verify Welcome Message After Login Using Welcome Locator
    Verify Welcome Message After Login Using User_id
    Agent Work Mode Selection     ${user_work_mode}
    Agent Single Campaign Selection    ${campaign_select_by_user}
    Agent Logout
    sleep    10

Agent All Campaign Selection
    [Documentation]    Agent ALL Campaign Selection
    [Tags]    Smoke11
    Login User    ${user_id}    ${user_password}
    log to console    user login successfully
#    Force Login User
#    log to console    user force login successfully
    #Verify Welcome Message After Login Using Welcome Locator
    Verify Welcome Message After Login Using User_id
    Agent Work Mode Selection     ${user_work_mode}
    Agent MultiPle Campaign Selection    ${all_campaign_select_by_user}
    Agent Logout
    sleep    10