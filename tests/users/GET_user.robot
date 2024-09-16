*** Settings ***
Resource    ../../resources/main.robot
Test Setup     Criar Sessão
Test Teardown    Deletar User Padrão

*** Test Cases ***
GET usuario id
    [Documentation]    Listar um usuario por id
    ${body}=    Body User  
    ${resposta}=    POST On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}    headers=${g_HEADERS_AUTHORIZATION}    
    ...    json=${body}    expected_status=201   
    Set Test Variable   ${user_id}    ${resposta.json()["user"]["_id"]}
    Should Not Be Empty    ${user_id}

    ${resposta}=    GET On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/${user_id}
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200
    Should Be Equal    ${resposta.json()['fullName']}    ${full_name}
    Should Be Equal    ${resposta.json()['mail']}    ${user_email}

    ${resposta}=    DELETE On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/${user_id}
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200 

    ${resposta}=    GET On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/${user_id}
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=404

GET listar usuarios
    [Documentation]    Listar usuarios
    ${body}=    Body User  
    ${resposta}=    POST On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}    headers=${g_HEADERS_AUTHORIZATION} 
    ...    json=${body}    expected_status=201   
    Set Test Variable   ${user_id}    ${resposta.json()["user"]["_id"]}

    ${resposta}=    GET On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200
    Should Not Be Empty    ${resposta.json()}

    ${resposta}=    DELETE On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/${user_id}
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200 

        
GET count usuarios
    [Documentation]    Contar usuarios
    ${resposta}=    GET On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/count
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200
    Should Not Be Empty    ${resposta.json()}
    Set Test Variable    ${count_antes}    ${resposta.json()['count']}   
    
    ${body}=    Body User  
    ${resposta}=    POST On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}    headers=${g_HEADERS_AUTHORIZATION} 
    ...    json=${body}    expected_status=201   
    Set Test Variable   ${user_id}    ${resposta.json()["user"]["_id"]}
    
    ${resposta}=    GET On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/count
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200
    Should Not Be Empty    ${resposta.json()}
    Set Test Variable    ${count_depois}    ${resposta.json()['count']}  
    ${count_antes}=    Evaluate    ${count_antes}+1   
    Should Be Equal    ${count_antes}    ${count_depois}

    ${resposta}=    DELETE On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/${user_id}
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200 


