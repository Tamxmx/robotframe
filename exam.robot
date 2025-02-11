*** Settings ***
Library            SeleniumLibrary
Suite Setup        Open Browser    https://automationexercise.com/	Chrome	
Suite Teardown     Close Browser


*** Variables ***
${NAME}    Blue Top

*** Keywords ***
INPUT NAME
    [Arguments]       ${NAME}
    Input Text        //*[@id="search_product"]    ${NAME}


CLICK SEARCH
    Click Button    //*[@id="submit_search"]

CLICK PRODUCT
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a


*** Test Cases ***
Check Translate Result
    Wait Until Page Contains Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[1]/a    timeout=10s
    CLICK PRODUCT
    Wait Until Page Contains Element    //*[@id="sale_image"]    timeout=10s
    INPUT NAME    ${NAME}
    CLICK SEARCH
    Wait Until Page Contains    text=Searched Products
    Wait Until Page Contains    text=View Product
    
    
