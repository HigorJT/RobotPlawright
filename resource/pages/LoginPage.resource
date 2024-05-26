*** Settings ***
Documentation

Library    String
Library    Browser
Resource    SignupPage.resource

*** Keywords ***

Submit login form
    [Arguments]    ${user}

    Fill Text    css=input[placeholder$=mail]   ${user}[email]
    Fill Text    css=input[placeholder$=mail]   ${user}$[password]

    Click    xpath=//button[text()="Entrar"]

    Click    css=button >> text=Entrar
