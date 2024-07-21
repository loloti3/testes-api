*** Settings ***
Resource    ../../resources/main.robot
Test Setup    suite setup criar sessao logar admin
Suite Teardown

*** Test Cases ***
POST criar usuario com sucesso
    [Tags]    T
    criar um usuario com sucesso


