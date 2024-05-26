*** Settings ***

Documentation    Cenários de testes do cadastro de usuários

Resource        ../resource/base.resource

Suite Setup       Log    Tudo aqui ocorre antes da Suite (antes de todos os testes)
Suite Teardown    Log    Tudo aqui ocorre depois da Suite (depois de todos os testes)

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***

Deve poder cadastrar um novo usuário

    ${user}    Create Dictionary
    ...        name= Higor de Jesus
    ...        email = higordejesus@hotmail.com
    ...        password = pwd123

    Remove user from database    ${user}[email]

    Go to signup page
    Submit signup form     ${user}
    Notice should be    Boas vindas ao Mark85, o seu gerenciador de tarefas.

   
Não deve permitir o cadastron com email duplicado
    [Tags]    dup

    ${user}    Create Dictionary
    ...        name= Higor Torres J
    ...        email= higorjesus20@hotmail.com
    ...        password= pwd123

    Remove user from database     ${user}[email]
    insert user from database     ${user}

    Go to signup page
    Submit signup form     ${user}
    Notice should be    Oops! Já existe uma conta com o e-mail informado.

      
Campos obrigatórios
    [Tags]    required

    ${user}    Create Dictionary
    ...        name= ${EMPTY}
    ...        email= ${EMPTY}
    ...        password= ${EMPTY}

    Go to signup page
    Submit signup form     ${user}

    Alert should be    Informe seu nome completo
    Alert should be    Informe seu e-mail
    Alert should be    Informe uma senha com pelo menos 6 dígitos

    Sleep    10s

Não deve cadastrar com email incorreto
    [Tags]    inv_email

    ${user}    Create Dictionary
    ...        name= Charles Xavier
    ...        email= xavier.com.br
    ...        password= 123456
    
    Go to signup page
    Submit signup form    ${user}
    Alert should be    Digite um e-mail válido

Não deve cadastrar com senha de 1 dígito
    [Tags]    short_pass
    [Template]
    Short password    1

Não deve cadastrar com senha de 2 dígitos
    [Tags]    short_pass
    [Template]
    Short password    12
   
Não deve cadastrar com senha de 3 dígitos
    [Tags]    short_pass
    [Template]
    Short password    123
   
Não deve cadastrar com senha de 4 dígitos
    [Tags]    short_pass
    [Template]
    Short password    1234

Não deve cadastrar com senha de 5 dígitos
    [Tags]    short_pass
    [Template]
    Short password    12345
   
   
*** Keywords ***

Short password
    [Arguments]    ${short_pass}

    ${user}    Create Dictionary
    ...        name= ${EMPTY}
    ...        email= ${EMPTY}
    ...        password= ${short_pass}
    
    Go to signup page
    Submit signup form     ${user}

    Alert should be    Informe uma senha com pelo menos 6 dígitos

    Sleep    10s
