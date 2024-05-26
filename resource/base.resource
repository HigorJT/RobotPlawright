*** Settings ***

Library    libs/database.py
Library    Browser
Library    JSONLibrary    # robotcode: ignore
Resource    ./env.resource

Resource    pages/components/Header.resource
Resource    pages/components/Notice.resource
Resource    pages/components/Alert.resource

Resource    pages/SignupPage.resource
Resource    pages/LoginPage.resource

*** Keywords ***

Start Session
    
    New Browser    browser=chromium    headless=false
    New Page       ${BASE_URL} 

Get fixture
    [Arguments]    ${file_name}    ${scenario}

    ${data}    Load Json From File    # robotcode: ignore
    ...    ${EXECDIR}/resource/fixtures/${file_name}.json
    ...    enconding=utf-8

    [Return]    ${data}[${scenario}]
