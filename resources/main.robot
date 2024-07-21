*** Settings ***
Documentation    contém todos os arquivos e bibliotecas nescessárias para realizar os testes

#bibliotecas
Library    Collections
Library    RequestsLibrary
Library    String
Library    FakerLibrary    locale=pt_BR

#arquivos

Resource    ./keywords/keywords_utils.robot
Resource    ./keywords/keywords_testes.robot
Resource    ./variables/variables_globals.robot
Resource    ./keywords/keywords_gerar_massa.robot
Resource    ./keywords_pages/delete_user_key.robot
