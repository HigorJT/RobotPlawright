*** Settings ***
Documentation    Cenários de cadastro de tarefas

#Library    JSONLibrary

Resource    ../../resource/base.resource

*** Test Cases ***

Deve poder cadastrar uma nova tarefa

    ${data}    Load Json From File
    ...    ${EXECDIR}/resource/fixtures/tasks.json
    ...    enconding=utf-8

    Log    $[data][create][user]


*** Keywords ***
Load Json From File
    [Arguments]    ${arg1}    ${enconding}
    # TODO: implement keyword "Load Json From File".
    Fail    Not Implemented
