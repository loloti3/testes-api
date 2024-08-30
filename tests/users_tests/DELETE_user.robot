*** Settings ***
Resource    ../../resources/main.robot
Test Setup   suite setup usuario logado

*** Test Cases ***
DELETE deletar usuario com sucesso
    [Documentation]    Deletar usuario com sucesso
    logar adimin
    listar usuario por id
    deletar usuario com id valido
    listar usuario com id invalido

