*** Settings ***
Resource    ../../resources/main.robot

*** Keywords ***
Massa Body user
    ${full_name}    gerar_nome_aleatorio
    ${user_email}    gerar_email_aleatorio
    ${user_password}    gerar_password_aleatorio
    ${cpf}    gerar_cpf_aleatorio
    Set Test Variable    ${full_name}        
    Set Test Variable    ${user_email}    
    Set Test Variable    ${cpf}    
    Set Test Variable    ${user_password}    