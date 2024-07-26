*** Settings ***
Resource    ../../resources/main.robot
Test Setup    suite setup criar sessao logar admin

*** Test Cases ***
POST criar usuario com sucesso
    criar um usuario com sucesso
    deletar usuario

