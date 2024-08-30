*** Settings ***
Resource    ../../resources/main.robot
Test Setup   suite setup pre requisito usuario ter feito login no sistema
Documentation    Casos de teste de deletar usuário

#para deletar um usuario é nescessário esta logado como admin 

*** Test Cases ***
DELETE deletar usuario com sucesso
    logar adimin
    listar usuario por id
    deletar usuario    
    listar usuario com id invalido

