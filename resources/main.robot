*** Settings ***
Documentation    contém todos os arquivos e bibliotecas nescessárias para realizar os testes

#bibliotecas
Library    Collections
Library    RequestsLibrary
Library    String
Library    FakerLibrary    locale=pt_BR

#arquivos

Resource    ./utils/keywords_utils.robot
Resource    ./utils/variables.robot
Resource    ./utils/keywords_gerar_massa.robot
Resource    ./bodys/user_body.resource
Variables   ./fixtures/config.yaml
Variables   ./fixtures/mensagens.yaml
Resource    ../tests/users/keywords_user.resource
Variables    ./fixtures/user.yaml
