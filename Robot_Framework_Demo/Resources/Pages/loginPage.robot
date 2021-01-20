***Setting***
Documentation    Login Page
Library    SeleniumLibrary    
***Variables***
${txt_Username_id}    id:Email
${txt_pwd_id}       id:Password
${btn_Login}    Log in


*** Keywords ***
Browser Setup
    [Documentation]    Setting up the browser
    Open Browser    url=https://admin-demo.nopcommerce.com/login?ReturnUrl=%2Fadmin%2F    browser=chrome
    Maximize Browser Window
    

Login Into the Admin Page
    [Arguments]    ${Username}    ${Password}
    Input Text    ${txt_Username_id}    ${Username}    clear=True    
    Input Password    ${txt_pwd_id}    ${Password}    clear=True 
    # Click Button    ${btn_Login}    
    Sleep    2s    


   
    




