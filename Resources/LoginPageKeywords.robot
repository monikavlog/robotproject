*** Settings ***
Library    SeleniumLibrary
Variables    LoginPageElements.py
Variables    ../Configs/test_config_data.py
Resource    ../Resources/BaseKeywords.robot

*** Keywords ***
Login User
    [Arguments]    ${user_id}    ${user_password}
    Input Text With Explicit Wait    ${user_id_x}    ${user_id}    20s
    Input Text With Explicit Wait    ${user_pass_x}   ${user_password}
    Click Element With Explicit Wait    ${loginButton_x}

Agent Logout
    click element with explicit wait    ${agent_preferences_shown}    70s
    click element with explicit wait    ${agent_preferences_options}    70s
    click element with explicit wait    ${agent_logout}    70s

Force Login User
    ${force_login_visible}    run keyword and return status    page should contain element    ${forcelogin_heading_x}
    log to console    ${force_login_visible}
    run keyword if    '${force_login_visible}' == 'True'    Click Element With Explicit Wait    ${forcelogin}
    log to console    Force login successfully after checking force log page

Agent Work Mode Selection
    [Arguments]    ${user_work_mode}
    Select One Value From Multiple    ${work_mode_list}    ${user_work_mode}
    Click Element With Explicit Wait    ${workmode_nextbutton}

Agent Single Campaign Selection
    [Arguments]    ${user_campaign_name}
    Click Element With Explicit Wait    ${voice_campaign_input}
    Select One Value From Multiple    ${voice_campaign_list}    ${user_campaign_name}
    Click Element With Explicit Wait    ${campaignselection_nextbutton_x}

Agent MultiPle Campaign Selection
    [Arguments]    ${user_campaign_list}
    log to console    control comes inside
    Click Element With Explicit Wait    ${voice_campaign_input}
    Select Multiple Value From Multiple    ${voice_campaign_list}    ${user_campaign_list}
    Click Element With Explicit Wait    `${campaignselection_nextbutton_x}

Verify Welcome Message After Login Using WelcomeUser Locator
    wait until element is visible    ${work_mode_list}
    page should contain element    ${welcome_user}

Verify Welcome Message After Login Using User_id
    wait until element is visible    ${work_mode_list}
    ${text}    get text    ${welcome_user}
    log to console    ${text}
    #page should contain textfield    ${text}
    should be equal as strings    ${welcome} ${user_id}    ${text}
    log to console    welcome string match the expected and Actual output


