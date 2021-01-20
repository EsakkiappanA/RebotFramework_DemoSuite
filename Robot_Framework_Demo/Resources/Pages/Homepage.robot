***Setting***
Documentation    Homepage
Library    SeleniumLibrary    

***Variables***
${txt_email_id}    id:SearchEmail
${btn_Search}    id:search-customers
${lbl_displayed_email}    css:#customers-grid td:nth-child(2)
${lnk_menu_customer}    xpath://a[@href='#']//span[text()='Customers']
${lnk_submenu_cust}    xpath=//a[@href='/Admin/Customer/List']    #default=/Admin/Customer/List    #xpath:(//ul[@class='treeview-menu']//span[contains(text(),'Customers')])[1]

*** Keywords ***
Search a Customer
    [Documentation]    Searching the customer
    [Arguments]    ${email_id}
    Input Text    ${txt_email_id}    ${email_id}    clear=True    
    Click Button    ${btn_Search}
    Validate Customer is Displayed   ${email_id} 
    

Validate Customer is Displayed
    [Documentation]    Validating the customer presence in DB
    [Arguments]    ${email_id}
    #Wait Until Element Is Visible    ${lbl_displayed_email}
    Sleep    5s    
    ${text}=  Get Text    ${lbl_displayed_email}
    ${test}=    Set Variable    her's
    Run Keyword If    '${text}' == '${email_id}'    Log    Customer present in the DB. 
    

Navigate to Customer Portal
    [Documentation]    Navigating to Customer portal from dashboard
    ${Status}=    Run Keyword And Return Status    Element Should Be Visible    ${lnk_submenu_cust}
    Run Keyword If    '${Status}' == 'True'    Click Element    ${lnk_submenu_cust}
    ...    ELSE    Run Keywords    Click Element   ${lnk_menu_customer}
    ...        AND    Click Element    ${lnk_submenu_cust}
    
                
       
    
     
        
           

   
    




