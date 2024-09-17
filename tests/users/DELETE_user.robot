*** Settings ***
Resource    ../../resources/main.robot
Test Setup     Criar Sessão
Test Teardown    Deletar User Padrão

*** Test Cases ***
DELETE usuario
    [Documentation]    Deletar um usuario com sucesso
    ${body}=    Body User  
    ${resposta}=    POST On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}    headers=${g_HEADERS_AUTHORIZATION}    
    ...    json=${body}    expected_status=201   
    Set Test Variable   ${user_id}    ${resposta.json()["user"]["_id"]}

    ${resposta}=    DELETE On Session    alias=Suits    url=${SERVIDOR['endpoint_user']}/${user_id}
    ...    headers=${g_HEADERS_AUTHORIZATION}    expected_status=200   
    Should Be Equal    ${resposta.json()['msg']}    ${MENSAGENS['usuario_deletado_sucesso']}
    
    
