*** Settings ***
Resource    ../../resources/main.robot
Suite Setup     suite setup pre requisito usuario ter feito login no sistema
Suite Teardown    suite teardown deletar usuario  
# Decidi criar esta suite setup pois em todos os testes estava criando uma sessão,logando com admin,criando usuario e fazendo
#login com o novo usuario, usando esta suite setup não preciso fazer todos estas etapas e reduz muito a quantidade de usuarios que ocupariam
#espaço de forma desnecessária no banco de dados.

*** Test Cases ***

GET listar usuario
    [Tags]    T 
    listar usuario

GET count usuario
    [Tags]    T
    ${COUNT_ANTES}=    contagem de usuarios
    criar um usuario com sucesso
    Log    ${COUNT_ANTES}
    ${COUNT_DEPOIS}=    contagem de usuarios    
    ${COUNT_ANTES}=    Evaluate    ${COUNT_ANTES}+1 
    Should Be Equal    ${COUNT_ANTES}   ${COUNT_DEPOIS}  
    Log    ${COUNT_ANTES}

GET listar usuario por id
    [Tags]    T
    listar usuario por id