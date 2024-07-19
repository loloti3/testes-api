*** Settings ***
Documentation    contém todos os arquivos e bibliotecas nescessárias para realizar os testes

#bibliotecas
Library    Collections
Library    RequestsLibrary
Library    String

#arquivos

Resource    ./keywords/keywords_utils.robot
Resource    ./keywords/keywords_testes.robot
Resource    ./variables/variables_globals.robot
