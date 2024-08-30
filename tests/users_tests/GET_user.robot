*** Settings ***
Resource    ../../resources/main.robot
Test Setup     suite setup pre requisito usuario ter feito login no sistema

# Decidi criar esta suite setup pois em todos os testes estava criando uma sessão,logando com admin,criando usuario e fazendo
#login com o novo usuario, usando esta suite setup não preciso fazer todos estas etapas e reduz muito a quantidade de usuarios que ocupariam
#espaço de forma desnecessária no banco de dados.

*** Test Cases ***
GET listar usuario por id
    listar usuario por id
    logar adimin
    deletar usuario
    deletar usuario com id invalido



