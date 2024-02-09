*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://google.com
${browser}  chrome

*** Keywords ***
start browser and maximize
    open browser  ${url}  ${browser}
    maximize browser window

close browser window
    ${title}=   get title
    log to console    ${title}
    close browser


*** Test Cases ***
Demo test case 1
  [Documentation]  google open page
  [Tags]  smoke
  start browser and maximize
  input text  xpath://textarea[@name="q"]  mobile
  press keys  xpath://div[@class="lJ9FBc"]//input[@value="Google Search"]  [Return]
  sleep  10
  close browser window


