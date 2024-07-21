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

listar usuario
    ${headers}=    Create Dictionary    accept=application/json    Content-Type=application/json    Authorization=${TOKEN} 
    ${resposta}=    GET On Session    alias=Suits    url=/api/user    headers=${headers}    expected_status=200
    Log    ${resposta.json()}

contagem de usuarios
   ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    Authorization=${TOKEN}
   ${resposta}=    GET On Session    alias=Suits    url=/api/user/count    headers=${headers}    expected_status=200
   Log    ${resposta.json()}
   Set test Variable   ${count}    ${resposta.json()["count"]}
   Log    ${count}
   RETURN    ${count}

listar usuario por id
    ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    Authorization=${TOKEN}
    ${resposta}=    GET On Session    alias=Suits    url=/api/user/${USER_ID}    headers=${headers}    expected_status=200
    Log    ${resposta.json()}
    Set Variable   ${user_id}    ${resposta.json()["_id"]}
    Log    ${user_id}
    Log    ${USER_ID}
    Should Be Equal    ${user_id}    ${USER_ID}

listar usuario com id invalido
    ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    Authorization=${TOKEN}
    ${resposta}=    GET On Session    alias=Suits    url=/api/user/${USER_ID}    headers=${headers}    expected_status=404
    Log    ${resposta.json()}
    Set test Variable   ${mensagem}    ${resposta.json()["alert"][0]}
    Should Be Equal    ${mensagem}    ${MENSAGEM_USUARIO_NAO_EXISTE}

atualizar dados usuario por id

    ${nome}=    FakerLibrary.Name
    ${email}=    FakerLibrary.Email

    ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    Authorization=${TOKEN}
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

deletar usuario
    ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    Authorization=${TOKEN}
    ${resposta}=    DELETE On Session    alias=Suits    url=/api/user/${USER_ID}       headers=${headers}    expected_status=200 
    Log    ${resposta.json()}
    Should Be Equal    ${resposta.json()["msg"]}    ${MENSAGEM_USUARIO_DELETADO_SUCESSO}    

deletar usuario com id invalido
    ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    Authorization=${TOKEN}
    ${resposta}=    DELETE On Session    alias=Suits    url=/api/user/${USER_ID}       headers=${headers}    expected_status=400
    Log    ${resposta.json()}    
    Should Be Equal    ${resposta.json()["alert"][0]}     ${MENSAGEM_USUARIO_NAO_EXISTE}   



