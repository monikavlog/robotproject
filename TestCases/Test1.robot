*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://google.com
${browser}  chrome


*** Test Cases ***
Demo test case 1
  [Documentation]  google open page
  [Tags]  smoke
  open browser  ${url}  ${browser}
  maximize browser window
  input text  xpath://textarea[@name="q"]  mobile
  press keys  xpath://div[@class="lJ9FBc"]//input[@value="Google Search"]  [Return]
  sleep  20
  close browser


