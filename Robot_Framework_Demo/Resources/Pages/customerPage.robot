*** Settings ***
Documentation    Customerpage to do all customer actions
Library   SeleniumLibrary 
Library    ../../CustomLib/Excel.py  
         


*** Variables ***
${btn_NewCust}    xpath://a[@href='/Admin/Customer/Create']
${txt_email}    id:Email
${txt_pwd}    id:Password
${txt_firstName}    id:FirstName
${txt_lastName}    id:LastName
${rdbtn_male}    id:Gender_Male
${txt_DOB}    id:DateOfBirth
${txt_company}    id:Company
${chkbx_taxExempt}    id:IsTaxExempt
${drpdwn_MOV}    id:VendorId
${txt_adminComment}    id:AdminComment
${btn_save}    name:save
${lbl_successBanner}    css:div.alert.alert-success.alert-dismissable

${company_name}=    xyz
${com_lastname}    =    commonlastname


*** Keywords ***
Add New Customer
    [Documentation]    Adding new customer
    ${total_rows}=    Get Total Rows    ${EXECDIR}/Data/DataSheet.xlsx    0
    
    Log    ${total_rows}
    Click Element    ${btn_NewCust}
    Input Text    ${txt_lastName}    ${com_lastname}   
    Input Text    ${txt_company}    ${company_name}        
    FOR  ${i}  IN RANGE    1  ${total_rows}
          @{data}=    Read ExcelRow File    ${EXECDIR}/Data/DataSheet.xlsx    0    ${i}
          # Log Many    @{data}  
        
        Wait Until Location Is    https://admin-demo.nopcommerce.com/Admin/Customer/Create    timeout=30s        
        Wait Until Element Is Visible    ${txt_email}    timeout=30s
        Input Text    ${txt_email}    ${data}[0]    clear=True
        Input Password     ${txt_pwd}    ${data}[1]    clear=True
        Input Text    ${txt_firstName}    ${data}[2]    clear=True
        
        Click Element    ${rdbtn_male}
        Input Text    ${txt_DOB}    ${data}[4]    clear=True
            
        Click Element    ${chkbx_taxExempt}    
        Click Element    ${drpdwn_MOV}
        Select From List By Value    ${drpdwn_MOV}    1
        Input Text    ${txt_adminComment}    ${data}[6]    clear=True
        Sleep    3s       
    END 
    # Click Button    ${btn_save}
    # Wait Until Location Is    https://admin-demo.nopcommerce.com/Admin/Customer/List    timeout=30s
    # Wait Until Element Is Visible    ${lbl_successBanner}    timeout=30s
