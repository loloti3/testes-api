*** Settings ***
Documentation    contém todos os arquivos e bibliotecas nescessárias para realizar os testes

#bibliotecas
Library    Collections
Library    RequestsLibrary
Library    String

Resource    ./utils/keywords_utils.resource
Resource    ./utils/variables.resource
Resource    ./utils/keywords_gerar_massa.resource
Resource    ./bodys/user_body.resource
Resource    ../tests/users/keywords_user.resource


Variables   ./fixtures/config.yaml
Variables   ./fixtures/mensagens.yaml
Variables    ./fixtures/user.yaml
