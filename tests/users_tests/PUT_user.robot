*** Settings ***
Resource    ../../resources/main.robot
Suite Setup    suite setup criar sessao logar admin e criar usuario
Suite Teardown    suite teardown deletar usuario
# Decidi criar esta suite setup pois em todos os testes estava criando uma sessão,logando com admin,criando usuario e fazendo
#login com o novo usuario, usando esta suite setup não preciso fazer todos estas etapas e reduz muito a quantidade de usuarios que ocupariam
#espaço de forma desnecessária no banco de dados.

*** Test Cases ***
PUT atualizar nome e email do usuario por id
    logar auth    ${USER_EMAIL}    ${USER_PASSWORD}
    atualizar dados usuario por id
 

PUT atualziar nome e email com o campo email em branco  
    logar auth    ${USER_EMAIL}    ${USER_PASSWORD}  
    ${email}    Set Variable    
    ${nome}    gerar_nome_aleatorio
    ${mensagem}=    Create List    ${MENSAGEM_CAMPO_EMAIL_OBRIGATORIO}    
    atualizar dados usuario com campos em branco    ${email}    ${nome}    ${mensagem}    

PUT atualziar nome e email com o campo nome em branco
    logar auth    ${USER_EMAIL}    ${USER_PASSWORD}
    ${email}    gerar_email_aleatorio    
    ${nome}    Set Variable    
    ${mensagem}=    Create List    ${MENSAGEM_CAMPO_NOME_OBRIGATORIO}    
    atualizar dados usuario com campos em branco    ${email}    ${nome}    ${mensagem} 

PUT atualziar nome e email em branco
    logar auth    ${USER_EMAIL}    ${USER_PASSWORD}
    ${email}    Set Variable    
    ${nome}    Set Variable    
    ${mensagem}=    Create List    ${MENSAGEM_CAMPO_NOME_OBRIGATORIO}    ${MENSAGEM_CAMPO_EMAIL_OBRIGATORIO}    
    atualizar dados usuario com campos em branco    ${email}    ${nome}    ${mensagem}

PUT atualizar nome invalido com numeros
    logar auth    ${USER_EMAIL}    ${USER_PASSWORD}
    ${email}    gerar_email_aleatorio    
    ${nome}    gerar_nome_aleatorio_com_numeros   
    Log    ${nome}     
    ${mensagem}=    Create List    ${MENSAGEM_CAMPO_NOME_COM_NUMEROS}        
    atualizar dados usuario com campos em branco    ${email}    ${nome}    ${mensagem}

PUT atualizar nome invalido minusculo
    logar auth    ${USER_EMAIL}    ${USER_PASSWORD}
    ${email}    gerar_email_aleatorio    
    ${nome}    gerar_nome_aleatorio_minusculo 
    Log    ${nome}     
    ${mensagem}=    Create List    ${MENSAGEM_CAMPO_NOME_INVALIDO}       
    atualizar dados usuario com campos em branco    ${email}    ${nome}    ${mensagem}

PUT atualizar nome invalido com caracteres especiais
    logar auth    ${USER_EMAIL}    ${USER_PASSWORD}
    ${email}    gerar_email_aleatorio    
    ${nome}    gerar_nome_aleatorio_caracters_especiais
    Log    ${nome}     
    ${mensagem}=    Create List    ${MENSAGEM_CAMPO_NOME_INVALIDO}       
    atualizar dados usuario com campos em branco    ${email}    ${nome}    ${mensagem}


PUT atualizar status
    criar sessão
    logar adimin
    criar um usuario com sucesso 
    mudar status usuario    false
    mudar status usuario    true




             
    
