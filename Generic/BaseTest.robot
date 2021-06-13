*** Settings ***
Library    SeleniumLibrary
Library    ../Configuration/ExcelHelper.py    SG              
Library    ../Configuration/ConfigHelper.py    

       
*** Variables ***
${EXECUTABLE_PATH}
${URL}
${BROWSER_NAME}
${USERNAME}
${PASSWORD}
${GROUP_ID}
${OBJEXCELHELPER}
*** Keywords ***
Initialise_Environment
    readConfigFile
    ${BROWSER_NAME}=    getConfigValue    Environment    Browser_Name
    ${EXECUTABLE_PATH}=    getConfigValue    Environment    EXECUTABLE_PATH
    ${URL}=    getConfigValue    Environment    URL
    Create Webdriver    ${BROWSER_NAME}    executable_path=${EXECUTABLE_PATH}
    Maximize Browser Window
    Go To    ${URL}
    ${STATUS}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://form[@name="loginFormQA"]
    Run Keyword If    ${STATUS}==True    Log    BIBPLUS Launched Successfully
    ...    ELSE    Fail    BIBPLUS Launch Failed

Load_Test_Data
    [Arguments]    ${rowID}
    loadTestData    ${rowID}    