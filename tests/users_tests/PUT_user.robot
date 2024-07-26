*** Settings ***
Resource    ../../resources/main.robot
Suite Setup    suite setup pre requisito usuario ter feito login no sistema
Suite Teardown    suite teardown deletar usuario
# Decidi criar esta suite setup pois em todos os testes estava criando uma sessão,logando com admin,criando usuario e fazendo
#login com o novo usuario, usando esta suite setup não preciso fazer todos estas etapas e reduz muito a quantidade de usuarios que ocupariam
#espaço de forma desnecessária no banco de dados.

*** Test Cases ***
PUT atualizar nome e email do usuario por id
    atualizar dados usuario por id

PUT atualziar nome e email com o campo email em branco    
    ${email}    Set Variable    
    ${nome}    gerar_nome_aleatorio
    ${mensagem}=    Create List    ${MENSAGEM_CAMPO_EMAIL_OBRIGATORIO}    
    atualizar dados usuario com campos em branco    ${email}    ${nome}    ${mensagem}    

PUT atualziar nome e email com o campo nome em branco
    ${email}    gerar_email_aleatorio    
    ${nome}    Set Variable    
    ${mensagem}=    Create List    ${MENSAGEM_CAMPO_NOME_OBRIGATORIO}    
    atualizar dados usuario com campos em branco    ${email}    ${nome}    ${mensagem} 

PUT atualziar nome e email com os dois campos em branco
    ${email}    Set Variable    
    ${nome}    Set Variable    
    ${mensagem}=    Create List    ${MENSAGEM_CAMPO_NOME_OBRIGATORIO}    ${MENSAGEM_CAMPO_EMAIL_OBRIGATORIO}    
    atualizar dados usuario com campos em branco    ${email}    ${nome}    ${mensagem}









             
    
