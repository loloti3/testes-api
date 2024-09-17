*** Settings ***
Documentation    contém todos os arquivos e bibliotecas nescessárias para realizar os testes

#bibliotecas
Library    Collections
Library    RequestsLibrary
Library    String

#arquivos

Resource    ./utils/keywords_utils.resource
Resource    ./utils/variables.resource
Resource    ./utils/keywords_gerar_massa.resource
Resource    ./bodys/user_body.resource
Variables   ./fixtures/config.yaml
Variables   ./fixtures/mensagens.yaml
Resource    ../tests/users/keywords_user.resource
Variables    ./fixtures/user.yaml
