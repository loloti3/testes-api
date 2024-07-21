*** Settings ***
Documentation    contém as keywords que são pré requisitos para os testes 
Resource    ../main.robot
Library    OperatingSystem

*** Keywords ***

suite setup criar sessao logar admin
    criar sessão
    logar adimin   

suite setup pre requisito usuario ter feito login no sistema
    criar sessão
    logar adimin
    criar um usuario com sucesso
    logar auth    ${USER_EMAIL}    ${USER_PASSWORD} 

suite teardown deletar usuario
    deletar usuario

logar adimin
    ${body}=    Create Dictionary    mail=${EMAIL_ADMIN}    password=${PASSWORD_ADMIN}
    Log    ${body}
    ${resposta}=    POST On Session    alias=Suits    url=/api/${login_auth}    json=${body}    expected_status=200
    Log    ${resposta.json()}  
    Set Global Variable    ${TOKEN}    ${resposta.json()['token']}            
    Log    ${TOKEN}

criar sessão 
    ${headers}=    Create Dictionary     Accept=application/json    Content-Type=application/json    
    Create Session    alias=Suits    url=${URL_SUITS}    headers=${headers}

criar um usuario com sucesso
    #gerar massas
    ${FULL_NAME}    gerar_nome_aleatorio
    ${user_email}    gerar_email_aleatorio
    ${user_password}    gerar_password_aleatorio
    ${CPF}    gerar_cpf_aleatorio

    Set Global Variable   ${USER_EMAIL}    ${user_email}
    Set Global Variable    ${USER_PASSWORD}    ${user_password}
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

    Set Global Variable   ${USER_ID}    ${resposta.json()["user"]["_id"]}   
    Log    ${USER_ID} 

