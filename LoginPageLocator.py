class LoginPageElements:
   user_id_x=(By.XPATH, '//input[@automationid="enterLoginUsername"]')
   user_pass_x=(By.XPATH, '//input[@automationid="enterLoginPassword"]')
   loginButton_x=(By.XPATH, '//button[@automationid="loginButton"]')
   forcelogin =(By.XPATH, '//button[@automationid="confirmationBtn1"]')
   work_mode_list=(By.XPATH, '//input[@name="workingMode"]/following-sibling::label')
   workmode_nextbutton=(By.XPATH,'//button[span[text()="Next"]]')
   voice_campaign_input=(By.XPATH,'//input[@placeholder="Select Voice Campaign"]')
   voice_campaign_list=(By.XPATH,'//ul[@class="select2-results__options"]/li')
   campaignselection_nextbutton_x=(By.XPATH,'//span[text()="Next"]/parent::button')
   extension_selection_input=(By.XPATH,'//span[@automationid="dispositionCodesShowListItems"]')
   extension_selection_list=(By.XPATH,'//ul[@role="tree"]/li')
   numberenter_after_extension_selection=(By.XPATH,'//input[@placeholder="Enter Number"]')
   extensionselection_nextbutton=(By.XPATH,'//button[@automationid="extensionSaveBtn"]')
   welcome_user = (By.XPATH, '//span[@automationid="welcomeUser"]')

   from selenium.webdriver.common.by import By

   class HomePageElements:
       agent_status_dropdown = (By.XPATH, '//a[@automationid="agentAvailibilityStatusDropdown"]')
       agent_status_selection = (By.XPATH, '//*[@automationid="Available"]')
       agent_break_list = (By.XPATH, '//ul[@id="statusDropdown"]/li')
       autocall_dropdown = (By.XPATH, '//div[@class="switch-mode"]//a')
       autocall_on_off = (By.XPATH, '//li[@class="showElement"]/div[@id="automode"]')
       agent_preferences_shown = (By.XPATH, '//div[@automationid="agentPreferenceContainer"]')
       agent_preferences_options = (By.XPATH, '//div[@automationid="agentPreferenceContainer"]/ul/li')
       agent_logout = (By.XPATH, '//li[@automationid="logoutBtn"]')

       def select_multiple_value_multiple(self, by_locator, user_value_list):
           by, locator = by_locator
           list = self.driver.find_elements(by, locator)
           if user_value_list[0] == "all":
               for element in list:
                   element.click()
           else:
               for element in list:
                   if element.text in user_value_list:
                       element.click()

       def is_value_selected(self, by_locator):
           by, locator = by_locator
           element = self.driver.find_element(by, locator)
           print("Value of selected element:", element.is_selected())
           # if not element.is_selected():
           #     element.click()
           return element.is_selected()
