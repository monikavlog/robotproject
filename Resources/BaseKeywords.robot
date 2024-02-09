*** Settings ***
Documentation    This page contains keywords and variables
Library    SeleniumLibrary
Variables    ../Configs/env_config.py

*** Keywords ***
start and maximize browser
    open browser    ${url}    ${browser}
    maximize browser window
#    ${implicit wait}    get selenium implicit wait
#    log to console    value of implicit wait    ${implicit wait}
    set selenium implicit wait    30s
    #${implicit wait after set}    get selenium implicit wait
    #log to console    value of implicit wait after set    ${implicit wait after set}

close browser window
#    ${title}    get title
#    log to console  Title of browser    ${title}
    close browser

Select One Value From Multiple
    [Arguments]    ${locator}    ${value}
    log to console    value passed by user    ${value}
    ${elements} =    get webelements    ${locator}
    FOR    ${element}    IN    @{elements}
      ${text} =  get text    ${element}
      Log To Console    Element text: ${text}
      IF   '${text}' == '${value}'
        click element    ${element}
        Log To Console    Selected Element text: ${text}
        BREAK
      END
    END

Select Multiple Value From Multiple
    [Arguments]    ${locator}    ${user_value_list}
    Log To Console    ${user_value_list}
    ${elements_list}  get webelements    ${locator}
    IF    ${user_value_list[0]} == 'all'
     log to console    comparison pass
      FOR    ${element}    IN    @{elements_list}
        click element    ${element}
        END
        log to console    All Campaign Selected:    ${elements_list}
    ELSE
      FOR    ${element}    IN    @{elements_list}
        ${text} =    get text    ${element}
        IF    '${text}'    IN    '${user_value_list}'
          click element    ${element}
        END
      END
      Log To Console    Selected Campaign List: ${element}
    END

Click Element With Explicit Wait
    [Arguments]    ${locator}    ${timeout}=60s
    Wait Until Element Is Clickable    ${locator}    ${timeout}
    click element    ${locator}

Input Text With Explicit Wait
    [Arguments]    ${locator}    ${text}    ${timeout}=60s
    wait until element is visible    ${locator}    ${timeout}
    input text  ${locator}    ${text}

Wait Until Element Is Clickable
    [Arguments]    ${locator}    ${timeout}=60s
    wait until element is visible    ${locator}    ${timeout}
    wait until element is enabled    ${locator}    ${timeout}




