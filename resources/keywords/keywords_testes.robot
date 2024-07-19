*** Settings ***
Documentation    keywords utilizadas nos testes 
Resource    ../main.robot

*** Keywords ***

criar sessão 
    ${headers}=    Create Dictionary     Accept=application/json    Content-Type=application/json    
    Create Session    alias=Suits    url=${URL_SUITS}    headers=${headers}

logar admin
    [Arguments]    ${email}    ${senha}
    ${body}=    Create Dictionary    mail=${email}    password=${senha}
    Log    ${body}
    ${resposta}=    POST On Session    alias=Suits    url=/api/${login_auth}    json=${body}    expected_status=200
    Log    ${resposta.json()}  
    Set Test Variable    ${TOKEN}    ${resposta.json()['token']}            
    Log    ${TOKEN}

criar um usuario
    
    #gerar massas
    ${FULL_NAME}    gerar_nome_aleatorio
    ${USER_EMAIL}    gerar_email_aleatorio
    ${USER_PASSWORD}    gerar_password_aleatorio
    ${CPF}    gerar_cpf_aleatorio

    ${headers}=    Create Dictionary    accept=application/json    Content-Type=application/json    Authorization=${TOKEN}
    ${body}=    Create Dictionary
    ...    fullName=${FULL_NAME}
    ...    mail=${USER_EMAIL}
    ...    password=${USER_PASSWORD}
    ...    accessProfile=${ACESS_PROFILE}
    ...    cpf=${CPF}
    ...    confirmPassword=${USER_PASSWORD}    

    Log Dictionary    ${body}  
    
    ${resposta}=    POST On Session    alias=Suits    url=/api/user    headers=${headers}    json=${body}    expected_status=201   
    Log    ${resposta.json()}

    Set Test Variable    ${USER_ID}    ${resposta.json()["user"]["_id"]}   
    Log    ${USER_ID}  

listar usuario
    ${headers}=    Create Dictionary    accept=application/json    Content-Type=application/json    Authorization=${TOKEN} 
    ${resposta}=    GET On Session    alias=Suits    url=/api/user    headers=${headers}    expected_status=200
    Log    ${resposta.json()}