*** Settings ***
Documentation    keywords utilizadas nos testes 
Resource    ../main.robot

*** Keywords ***

criar sessão 
    ${headers}=    Create Dictionary     Accept=application/json    Content-Type=application/json    
    Create Session    alias=Suits    url=${URL_SUITS}    headers=${headers}

logar auth
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
    ${user_email}    gerar_email_aleatorio
    ${user_password}    gerar_password_aleatorio
    ${CPF}    gerar_cpf_aleatorio
    Set Test Variable    ${USER_EMAIL}    ${user_email}
    Set Test Variable    ${USER_PASSWORD}    ${user_password}
    Log    ${user_email}
    Log    ${user_password}

    ${headers}=    Create Dictionary    accept=application/json    Content-Type=application/json    Authorization=${TOKEN}
    ${body}=    Create Dictionary
    ...    fullName=${FULL_NAME}
    ...    mail=${user_email}
    ...    password=${user_password}
    ...    accessProfile=${ACESS_PROFILE}
    ...    cpf=${CPF}
    ...    confirmPassword=${user_password}    

    Log Dictionary    ${body}  
    
    ${resposta}=    POST On Session    alias=Suits    url=/api/user    headers=${headers}    json=${body}    expected_status=201   
    Log    ${resposta.json()}

    Set Test Variable    ${USER_ID}    ${resposta.json()["user"]["_id"]}   
    Log    ${USER_ID}  

listar usuario
    ${headers}=    Create Dictionary    accept=application/json    Content-Type=application/json    Authorization=${TOKEN} 
    ${resposta}=    GET On Session    alias=Suits    url=/api/user    headers=${headers}    expected_status=200
    Log    ${resposta.json()}