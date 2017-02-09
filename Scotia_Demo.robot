*** Settings ***
Library           Selenium2Library

*** Variables ***
${01.PersonalBank_Search_Value}    Personal Loans
${03.PersonalBank_ActivateNow_InvalidCardNumber}    1002100310041005

*** Test Cases ***
01.PersonalBank_Search
    [Documentation]    Verify the Search functionality is working fine in Personal Bank page
    Open Browser    http://www.scotiabank.com/ca/en/0,,2,00.html    gc
    Maximize Browser Window
    Comment    ***** Click on Personal Banking Tab *****
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Personal Banking')]    10s
    Sleep    4s
    Click Element    xpath=//a[contains(text(),'Personal Banking')]
    Comment    ***** Search for Personal Loans *****
    Wait Until Element Is Visible    xpath=//input[@id='search-query']    10s
    Input Text    xpath=//input[@id='search-query']    ${01.PersonalBank_Search_Value}
    Wait Until Element Is Visible    xpath=//input[@id='search-submit']    10s
    Click Element    xpath=//input[@id='search-submit']
    Comment    ***** Verify Search Result URL is Displayed *****
    Wait Until Element Is Visible    xpath=//strong[contains(text(),'Personal Loans')]/parent::a    10s
    Sleep    5s
    Log    The Search results for Personal Loan is displayed successfully
    [Teardown]    Close Browser

02.PersonalBank_LogOn
    [Documentation]    Verify the Activate Now is \ directing to Login option from Personal Bank page
    Open Browser    http://www.scotiabank.com/ca/en/0,,2,00.html    gc
    Maximize Browser Window
    Comment    ***** Click on Personal Banking Tab *****
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Personal Banking')]    10s
    Sleep    2s
    Comment    ***** Click on Activate Now link *****
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Activate Now')]    10s
    Click Element    xpath=//a[contains(text(),'Activate Now')]
    Comment    ***** Verify Login page is displayed *****
    Sleep    6s
    Log    The Login Page \ is displayed successfully
    [Teardown]    Close Browser

03.PersonalBank_ActivateNow
    [Documentation]    Verify the Activate Now functionality
    Open Browser    http://www.scotiabank.com/ca/en/0,,2,00.html    gc
    Maximize Browser Window
    Comment    ***** Click on Personal Banking Tab *****
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Personal Banking')]    10s
    Sleep    5s
    Click Element    xpath=//a[contains(text(),'Personal Banking')]
    Comment    ***** Click on Activate Now link *****
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Activate Now')]    10s
    Click Element    xpath=//a[contains(text(),'Activate Now')]
    Sleep    4s
    Comment    ***** Click Activate Now button in Login Page *****
    Wait Until Element Is Visible    xpath=//input[@value='Activate Now']    10s
    Click Element    xpath=//input[@value='Activate Now']
    Comment    ***** Select Scotia Card option *****
    Wait Until Element Is Visible    xpath=//option[contains(text(),'ScotiaCard')]
    Sleep    3s
    Click Element    xpath=//option[contains(text(),'ScotiaCard')]
    Comment    ***** Enter Invalid details *****
    Wait Until Element Is Visible    xpath=//input[@placeholder='Card number']
    Input text    xpath=//input[@placeholder='Card number']    ${03.PersonalBank_ActivateNow_InvalidCardNumber}
    Wait Until Element Is Visible    xpath=//button[@id='confirmButton']
    Click Element    xpath=//button[@id='confirmButton']
    Comment    *****Verify Error message is displayed *****
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Sorry')]
    Sleep    5s
    Log    Error message is displayed successfully after entering invalid card details for the Scotia Card option
    [Teardown]    Close Browser
