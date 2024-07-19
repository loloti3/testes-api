*** Settings ***
Documentation   contém os testes de sucesso de Users
Resource    ../../resources/main.robot

*** Test Cases ***
POST criar usuario com sucesso
    criar sessão
    logar auth   ${EMAIL_ADMIN}    ${PASSWORD_ADMIN}
    criar um usuario
    logar auth    ${USER_EMAIL}    ${USER_PASSWORD}

GET listar usuario
    criar sessão
    logar auth   ${EMAIL_ADMIN}    ${PASSWORD_ADMIN}    
    listar usuario




             
    
