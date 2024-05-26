*** Settings ***

Documentation    

Resource            ../resource/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot


*** Test Cases ***

Webapp deve estar online

    Get Title      equal    Mark85 by QAx
    Sleep    5s
