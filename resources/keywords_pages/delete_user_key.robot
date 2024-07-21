*** Settings ***
Resource    ../main.robot
Documentation    contem as keywords nescessárias para relaizar os testes de delete users 

*** Keywords ***

deletar usuario com id invalido
    ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    Authorization=${TOKEN}
    ${resposta}=    DELETE On Session    alias=Suits    url=/api/user/${USER_ID}       headers=${headers}    expected_status=400
    Log    ${resposta.json()}    
    Should Be Equal    ${resposta.json()["alert"][0]}     ${MENSAGEM_USUARIO_NAO_EXISTE}       

