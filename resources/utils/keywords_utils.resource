*** Settings ***
Documentation    contém as keywords que são pré requisitos para os testes 
Resource    ../main.robot
Library    OperatingSystem

*** Keywords ***

Criar Sessão 
    [Arguments]    ${log_level}
    ${headers}=    Create Dictionary     Accept=application/json    Content-Type=application/json    
    Create Session    alias=Suits    url=${SERVIDOR['url']}    headers=${headers}
    Set Log Level    ${log_level}           
    ${body}=    Create Dictionary    mail=${ADMIN['mail']}    password=${ADMIN['senha']}    
    ${resposta}=    POST On Session    alias=Suits    url=${SERVIDOR['endpoint_auth']}    json=${body}    expected_status=200    
    Set Suite Variable    ${TOKEN}    ${resposta.json()['token']}            
    ${headers}=    Create Dictionary   Authorization=${TOKEN}    Accept=application/json    Content-Type=application/json
    Set Global Variable    ${g_HEADERS_AUTHORIZATION}    ${headers}
    ${body}=    Body User  
    ${resposta}=    POST On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}    headers=${g_HEADERS_AUTHORIZATION}    json=${body}    expected_status=201   
    Set Suite Variable   ${s_USER_ID}    ${resposta.json()["user"]["_id"]}   

Deletar User Padrão
    ${resposta}=    DELETE On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/${s_USER_ID}    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200        

