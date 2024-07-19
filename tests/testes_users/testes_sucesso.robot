*** Settings ***
Resource    ../../resources/main.robot

*** Test Cases ***
POST criar usuario com sucesso
    criar sessão
    logar admin    ${EMAIL_ADMIN}    ${PASSWORD_ADMIN}
    criar um usuario

Get listar usuario
    criar sessão
    logar admin    ${EMAIL_ADMIN}    ${PASSWORD_ADMIN}    
    listar usuario




             
    
