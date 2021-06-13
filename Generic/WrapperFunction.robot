*** Settings ***
Library    SeleniumLibrary    
*** Variables ***

*** Keywords ***
common_Click_On_WebElement
    [Arguments]    ${locator}    ${log}
    ${STATUS}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator} 
    Run Keyword If    ${STATUS}==True    Run Keywords    
    ...    Log    Element is Visible : ${locator}
    ...    AND    Log To Console    Element is Visible : ${locator}
    ...    ELSE    Fail    Element Not Found : ${locator}   
    
    ${STATUS}    Run Keyword And Return Status    Wait Until Element Is Enabled    ${locator} 
    Run Keyword If    ${STATUS}==True    Run Keywords    
    ...    Log    Element is Enabled : ${locator}
    ...    AND    Log To Console    Element is Enabled : ${locator}
    ...    ELSE    Fail    Element Not Enable : ${locator}    
       
    ${orignal_Style}=    Get Element Attribute    ${locator}    style
    FOR    ${INDEX}    IN RANGE    0    3
    Execute Javascript    document.evaluate('//input[@title="Search"]',document.body,null,9,null).singleNodeValue.setAttribute('style', 'border:2px solid red; background:yellow');
    sleep    1s
    Execute Javascript    document.evaluate('//input[@title="Search"]',document.body,null,9,null).singleNodeValue.setAttribute('style', '${orignal_Style}');
    END
    ${STATUS}    Run Keyword And Return Status    Click Element    ${locator} 
    Run Keyword If    ${STATUS}==True    Run Keywords    
    ...    Log    ${log} 
    ...    AND    Log To Console    ${log} : Pass
    ...    ELSE    Fail    ${log} : Fail

common_SendKeys
    [Arguments]    ${locator}    ${Text}    ${log}
    ${STATUS}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator} 
    Run Keyword If    ${STATUS}==True    Run Keywords    
    ...    Log    Element is Visible : ${locator}
    ...    AND    Log To Console    Element is Visible : ${locator}
    ...    ELSE    Fail    Element Not Found : ${locator}   
    
    ${STATUS}    Run Keyword And Return Status    Wait Until Element Is Enabled    ${locator} 
    Run Keyword If    ${STATUS}==True    Run Keywords    
    ...    Log    Element is Enabled : ${locator}
    ...    AND    Log To Console    Element is Enabled : ${locator}
    ...    ELSE    Fail    Element Not Enable : ${locator}
    
    ${orignal_Style}=    Get Element Attribute    ${locator}    style
    FOR    ${INDEX}    IN RANGE    0    3
    Execute Javascript    document.evaluate('//input[@title="Search"]',document.body,null,9,null).singleNodeValue.setAttribute('style', 'border:2px solid red; background:yellow');
    sleep    1s
    Execute Javascript    document.evaluate('//input[@title="Search"]',document.body,null,9,null).singleNodeValue.setAttribute('style', '${orignal_Style}');
    END
    
    ${STATUS}    Run Keyword And Return Status    Input Text    ${locator}    ${Text}     
    Run Keyword If    ${STATUS}==True    Run Keywords    
    ...    Log    ${log} 
    ...    AND    Log To Console    ${log} : Pass
    ...    ELSE    Fail    ${log} : Fail
    
      
    
     