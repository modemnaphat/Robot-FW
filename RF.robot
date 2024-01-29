*** Settings ***
Documentation         This is a Quiz Robot Framework
Library               SeleniumLibrary
Suite Setup           Open Browser      http://automationexercise.com   chrome
Suite Teardown        Close Browser

*** Variables ***
${productname}       Blue Top
${email}             example103@email.com
${password}          103






*** Keywords ***

Click Products Button
    Click Element       //*[@id="header"]/div/div/div/div[2]/div/ul/li[2]

Input Product Name
    [Arguments]         ${productname}
    Input Text          //*[@id="search_product"]   ${productname}

Click Search Button
    Click Button        //*[@id="submit_search"]

Click Add To Cart
    Click Element        //*[@data-product-id="1"]

Click View Cart
    Click Element        //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a 
    # Click Element        //*[@id="cartModal"]/div/div/div[2]/p[2]/a/u  

Click Signup/Login 
    Click Element         //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

Input Email
    [Arguments]         ${email}
    Input Text          //*[@id="form"]/div/div/div[1]/div/form/input[2]  ${email}

Input Password 
    [Arguments]         ${password} 
    Input Text          //*[@id="form"]/div/div/div[1]/div/form/input[3]  ${password} 

Click Submit Login
    Click Button        //*[@id="form"]/div/div/div[1]/div/form/button

Click Cart Button
    Click Element       //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a



*** Test Cases ***
Search Products and Verify Cart After Login
    [Documentation]               Test Search Products and Verify Cart After Login
    Click Products Button

    Input Product Name      ${productname}
    Click Search Button

    Click Add To Cart
    Click View Cart

    Click Signup/Login
    Input Email              ${email}
    Input Password           ${password} 
    Click Submit Login

    Click Cart Button
 
