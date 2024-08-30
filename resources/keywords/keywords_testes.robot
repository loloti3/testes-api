*** Settings ***
Documentation    keywords utilizadas nos testes 
Resource    ../main.robot

*** Keywords ***

logar auth
    [Arguments]    ${email}    ${senha}
    ${body}=    Create Dictionary    mail=${email}    password=${senha}
    Log    ${body}
    ${resposta}=    POST On Session    alias=Suits    url=/api/${login_auth}    json=${body}    expected_status=200
    Log    ${resposta.json()}  
    Set Global Variable   ${TOKEN}    ${resposta.json()['token']}            
    Log    ${TOKEN}
    #Get Match Count    list    pattern


listar usuario por id
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    GET On Session    alias=Suits    url=/api/user/${USER_ID}    headers=${headers}    expected_status=200
    Log    ${resposta.json()}
    Set Variable   ${user_id}    ${resposta.json()["_id"]}
    Should Be Equal    ${user_id}    ${USER_ID}
    Should Be Equal    ${resposta.json()["mail"]}    ${USER_EMAIL}
    Should Be Equal    ${resposta.json()["fullName"]}    ${FULL_NAME} 


listar usuario com id invalido
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    GET On Session    alias=Suits    url=/api/user/${USER_ID}    headers=${headers}    expected_status=404
    Log    ${resposta.json()}
    Set test Variable   ${mensagem}    ${resposta.json()["alert"][0]}
    Should Be Equal    ${mensagem}    ${MENSAGEM_USUARIO_NAO_EXISTE}

atualizar dados usuario por id

    ${nome}=    FakerLibrary.Name
    ${email}=    FakerLibrary.Email

    Set Global Variable    ${USER_EMAIL}    ${email}
    ${headers}=    Create Dictionary    Authorization=${TOKEN}

    ${body}=    Create Dictionary    
    ...  fullName=${nome}
    ...  mail=${email}

    ${resposta}=    PUT On Session    alias=Suits    url=/api/user/${USER_ID}    json=${body}    headers=${headers}    expected_status=200
    Log     ${resposta.json()}
    Set test Variable   ${nome_agora}    ${resposta.json()["updatedUser"]["fullName"]}
    Set test Variable   ${email_agora}    ${resposta.json()["updatedUser"]["mail"]}
    Log    ${nome_agora}
    Log    ${email_agora}
    Should Be Equal    ${nome}    ${nome_agora}
    Should Be Equal    ${email}    ${email_agora}

atualizar dados usuario com campos em branco
    [Arguments]    ${email}    ${nome}    ${mensagem}
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${body}=    Create Dictionary    
    ...  fullName=${nome}
    ...  mail=${email}
    ${resposta}=    PUT On Session    alias=Suits    url=/api/user/${USER_ID}    json=${body}    headers=${headers}    expected_status=400
    Log     ${resposta.json()}
    Log    ${mensagem}
    Lists Should Be Equal   ${resposta.json()['error']}    ${mensagem}


deletar usuario   
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    DELETE On Session    alias=Suits    url=/api/user/${USER_ID}       headers=${headers}    expected_status=200 
    Log    ${resposta.json()}
    Should Be Equal    ${resposta.json()["msg"]}    ${MENSAGEM_USUARIO_DELETADO_SUCESSO}    

deletar usuario com id invalido
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    DELETE On Session    alias=Suits    url=/api/user/${USER_ID}       headers=${headers}    expected_status=400
    Log    ${resposta.json()}    
    Should Be Equal    ${resposta.json()["alert"][0]}     ${MENSAGEM_USUARIO_NAO_EXISTE}   


deletar usuario com campos incorretos
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    DELETE On Session    alias=Suits    url=/api/user/${USER_ID}       headers=${headers}    expected_status=400
    Log    ${resposta.json()}    
    Should Be Equal    ${resposta.json()["error"][0]}     ${MENSAGEM_USUARIO_NAO_EXISTE}   

mudar status usuario
    [Arguments]    ${status}    
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${body}    Create Dictionary    status=${status}
    ${resposta}    PUT On Session    alias=Suits    url=/api/user/status/${USER_ID}    json=${body}    headers=${headers}         
    Dictionary Should Contain Item    ${resposta.json()}    msg    Status do usuario atualizado com sucesso para status ${status}.


