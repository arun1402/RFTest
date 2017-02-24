*** Settings ***
Library           Selenium2Library

*** Variables ***
${browser}        ${EMPTY}
${FF_PROFILE}     C:\\Python27\\Lib\\site-packages\\selenium-2.53.1-py2.7.egg\\selenium\\webdriver\\firefox
${Recent_Awards_Selection}    BMO Capital Markets Named

*** Test Cases ***
Test1
    Open Browser    https://www.bmo.com/main/business    ${browser}    ff_profile_dir=${FF_PROFILE}
    Comment    **** Click on the Plans & Accounts ****
    Wait Until Element Is Visible    //span[contains(text(),'Plans &')]    10s
    Click Element    //span[contains(text(),'Plans &')]
    Comment    **** Select number of years in business (1 to 3) ****
    Wait Until Element Is Visible    //select[@id='yrs-in-biz']/option[contains(text(),'1 to 3 years')]
    Click Element    //select[@id='yrs-in-biz']/option[contains(text(),'1 to 3 years')]
    Comment    **** Select annual revenue Between $250k and $500k ****
    Wait Until Element Is Visible    //select[@id='anul-rev']/option[contains(text(),'Between $250K and $500K')]
    Click Element    //select[@id='anul-rev']/option[contains(text(),'Between $250K and $500K')]
    Comment    **** Select number of employees 1 to 4 ****
    Wait Until Element Is Visible    //select[@id='num-emp']/option[contains(text(),'1 to 4 employees')]
    Click Element    //select[@id='num-emp']/option[contains(text(),'1 to 4 employees')]
    Comment    **** Sleep for 3 seconds to view the results ****
    Sleep    3s
    Close Browser

Test2
    Open Browser    https://www.bmo.com    gc
    Maximize Browser Window
    Wait Until Element Is Visible    //span[contains(text(),'About BMO')]    15s
    Click Element    //span[contains(text(),'About BMO')]
    Comment    ####### Select from Recent Awards ###########
    Sleep    5s
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    //a[contains(text(),'${Recent_Awards_Selection}')]    15s
    Sleep    5s
    Click Element    //a[contains(text(),'${Recent_Awards_Selection}')]
    Sleep    5s
    Select Window    title=News Releases
    Wait Until Element Is Visible    //select/option[contains(text(),'BMO Financial Group - Awards and Recognition')]
    Sleep    3s
    Click Element    //select/option[contains(text(),'BMO Financial Group - Awards and Recognition')]
    Wait Until Element Is Visible    //button[contains(text(),'Go')]
    Click Element    //button[contains(text(),'Go')]
    Comment    ##### Wait for 8 seconds to visually see the results #####
    Sleep    8s
    [Teardown]    Close Browser
