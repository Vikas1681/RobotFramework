*** Settings ***
Library    SeleniumLibrary
Library    Process
Resource    ../Generic/WrapperFunction.robot
Resource    ../Generic/BaseTest.robot
Suite Setup    Initialise_Environment
Test Setup    Log    ${TEST_NAME}        

*** Variables ***
${executable_path}=   C:\\UTF\\UTF\\PracticeRobot\\drivers\\chromedriver.exe
${batFile}=    C:\\UTF\\UTF\\PracticeRobot\\drivers\\closeBrowser.bat    
${url}=     http://blrcssfbcc0007:7012/SG35.2.HFx/cust/portal/screen/
${browser}    Chrome
${btn_Search}    xpath://input[@title="Search"]    
${INT_AS_INT}    ${1}

*** Keywords ***
launch_Browser
    Create Webdriver    ${browser}    executable_path=${executable_path}
    Maximize Browser Window
       

launch_BIBPLUS
    Go To    ${url}
    ${STATUS}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://form[@name="loginFormQA"]
    Run Keyword If    ${STATUS}==True    Log    BIBPLUS Launched Successfully
    ...    ELSE    Fail    BIBPLUS Launch Failed

close_Browser
    SeleniumLibrary.Close All Browsers
    # Run Process    ${batFile}
    
enter_Text
    [Arguments]    ${locator}    ${text}    ${id}=null
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    ${default_Style}=    Get Element Attribute    ${locator}    style
    FOR    ${index}    IN RANGE    0    4
    Execute Javascript    document.evaluate('${locator}',document.body,null,9,null).singleNodeValue.setAttribute('style', 'border:2px solid red; background:yellow');
    Execute Javascript    document.evaluate('${locator}',document.body,null,9,null).singleNodeValue.setAttribute('style', '${default_Style}');
    END
    Input Text    ${locator}    ${text}
    
# click_Element
    # [Arguments]    ${locator}
    # Wait Until Element Is Visible    ${locator}
    # Wait Until Element Is Enabled    ${locator}
    # ${default_Style}=    Get Element Attribute    ${locator}    style
    # FOR    ${index}    IN RANGE    0    4
    # Execute Javascript    document.evaluate('${locator}',document.body,null,9,null).singleNodeValue.setAttribute('style', 'border:2px solid red; background:yellow');
    # Execute Javascript    document.evaluate('${locator}',document.body,null,9,null).singleNodeValue.setAttribute('style', '${default_Style}');
    # END 
    # SeleniumLibrary.Click Element    ${locator}    
    
       
    
    
login_To_BIBPLUS
    [Arguments]    ${GroupID}    ${UserName}    ${Password}
    enter_Text    //input[@id="company"]    ${GroupID}    company 
    enter_Text    //input[@id="username"]    ${UserName}    username 
    enter_Text    //input[@id="password"]    ${Password}    password   
    Wait Until Element Is Visible    xpath://button[@id="login_btn"]  
    Click Element    //button[@id="login_btn"]
    ${STATUS}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@id="loginFormOtp"]
    Run Keyword If    ${STATUS}==True    Log    Login To Bibplus is Successful
    ...    ELSE    Fail    Login Failed. 

enter_OTP
    [Arguments]    ${myToken}
    Create Webdriver    ${browser}    executable_path=${executable_path}
    Maximize Browser Window
    Go To    http://10.240.67.80:8085/dpsim/generateOTP.jsp?pibid=${myToken}&eselect=otp
    ${OTPValue}    Get Element Attribute    //input[@id="generatedOtp"]    value
    SeleniumLibrary.Close Browser
    Switch Browser    1
    Wait Until Element Is Visible    //input[@id="otp"]    
    Wait Until Element Is Enabled    //input[@id="otp"]    
    Input Text    //input[@id="otp"]    ${OTPValue} 
    Wait Until Element Is Visible    //button[@type="submit"]    
    Wait Until Element Is Enabled    //button[@type="submit"]    
    Click Element    //button[@type="submit"]  
    ${STATUS}    Run Keyword And Return Status    Wait Until Element Is Visible    //div[@role="dialog"]/div[@title="User's Information"]
    Run Keyword If    ${STATUS}==True    Log    User Logged In To BIBPLUS
    ...    ELSE    Fail    User Failed To Log In.  
    Run Keyword If    ${STATUS}==True    Click Element    //span[@id="okButton"]            
                       
                           
    
    

               
    
*** Test Cases ***
My_First_TestCase
    [Tags]    Basic
    launch_Browser
    launch_BIBPLUS
    @{listOfWebelements}    Get WebElements    xpath://a
    FOR    ${list}    IN    @{listOfWebelements}
        Log To Console    ${list}
        Log To Console    ${list.text}
        ${attrText}    Get Element Attribute    ${list}    text 
        Log To Console    ${attrText}        
    END
    ${count}    Set Variable    6
    ${count}    Run Keyword If    ${count}==5    Set Variable    6
    ...    ELSE    Set Variable    7
    Log To Console    ${count}
    login_To_BIBPLUS    NEWCOMP    SASSO1    password1
    enter_OTP    1000000007
    close_Browser 
    
My_Second_TC
    launch_Browser
    # Log To Console    ${KEYWORD STATUS} 
    Go To    https://www.google.com/
    common_Click_On_WebElement    ${btn_Search}    click On Search
    common_SendKeys    xpath://input[@title="Search"]    Hello_Hi_Bye_Bye    Enter Text In Seacrh Box
    Wait Until Element Is Visible    xpath://input[@title="Search"]
    
    Wait Until Element Is Visible    xpath://div[@class="FPdoLc lJ9FBc"]//input[@type="submit"]
    ${orignal_Style}=    Get Element Attribute    xpath://div[@class="FPdoLc lJ9FBc"]//input[@type="submit"]    style   
    Execute Javascript    document.evaluate('//div[@class="FPdoLc lJ9FBc"]//input[@type="submit"]',document.body,null,9,null).singleNodeValue.setAttribute('style', 'border:2px solid red; background:yellow');
    sleep    3s
    Execute Javascript    document.evaluate('//div[@class="FPdoLc lJ9FBc"]//input[@type="submit"]',document.body,null,9,null).singleNodeValue.setAttribute('style', '${orignal_Style}');
    # close_Browser
    
My_Third_TC
    loadTestData    100  
    
    
                 
       
        
        
    
    # ${length}    Get Length    @{listOfWebelements}    
    # Log To Console    ${length}
    # for        
    # close_Browser
    
    
       
      