*** Settings ***
Resource    ../../resources/main.robot
Test Setup    Criar Sessão  
Test Teardown    Deletar User Padrão

*** Test Cases ***
POST cadastra usuario
    [Documentation]    Criar usuario com sucesso
    ${body}=    Body User  
    ${resposta}=    POST On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}    headers=${g_HEADERS_AUTHORIZATION}    
    ...    json=${body}    expected_status=201   
    Set Test Variable   ${user_id}    ${resposta.json()["user"]["_id"]}
    Should Not Be Empty    ${user_id}

    ${resposta}=    GET On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/${user_id}
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200
    Log    ${resposta.json()}
    Should Be Equal    ${resposta.json()['fullName']}    ${full_name}
    Should Be Equal    ${resposta.json()['mail']}    ${user_email}

    ${resposta}=    DELETE On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/${user_id}
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200        

    
   
    


    

