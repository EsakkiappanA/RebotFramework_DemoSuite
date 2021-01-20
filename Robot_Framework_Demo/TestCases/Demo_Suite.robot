***Setting***
Documentation    Robot framework demo suite
Library    SeleniumLibrary 
Resource    ../Resources/Pages/Homepage.robot
Resource    ../Resources/Pages/loginPage.robot  
Resource    ../Resources/Pages/customerPage.robot 
Suite Setup    Browser Setup
Suite Teardown    Close All Browsers
Test Template    Login Into the Admin Page  


*** Test Cases ***  username    password
valid login         admin@yourstore.com    admin
invalid Username    admin1@xyz.com        admin
invalid password    admin@yourstore.com    admin1
    
    

# Adding new customer to DB
    # [Documentation]    Adding new customer to DB
    # Navigate to Customer Portal
    # Add New Customer


# Validating the Customer in DB
 #   [Documentation]    Validating the Customer in DB    
  #  Navigate to Customer Portal
   # Search a Customer    testUser3@xyz.com
