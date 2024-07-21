*** Settings ***
Resource    ../../resources/main.robot
Suite Setup     suite setup pre requisito usuario ter feito login no sistema
Suite Teardown    suite teardown deletar usuario
# Decidi criar esta suite setup pois em todos os testes estava criando uma sessão,logando com admin,criando usuario e fazendo
#login com o novo usuario, usando esta suite setup não preciso fazer todos estas etapas e reduz muito a quantidade de usuarios que ocupariam
#espaço de forma desnecessária no banco de dados.

*** Test Cases ***
PUT atualizar nome e email do usuario por id
    [Tags]    T
    atualizar dados usuario por id
    









             
    
