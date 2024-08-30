*** Settings ***
Resource    ../../resources/main.robot
Test Setup    logar adimin   

*** Test Cases ***
POST criar usuario com sucesso
    criar um usuario com sucesso
    listar usuario por id
    deletar usuario com id valido
    listar usuario com id invalido


    

