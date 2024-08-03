
*** Settings ***
Resource    ../main.robot

*** Variables ***
${EMPTY}    
${URL_SUITS}    https://suits.qacoders-academy.com.br
${EMAIL_ADMIN}    sysadmin@qacoders.com    
${PASSWORD_ADMIN}    1234@Test
${TOKEN}    EMPTY

#Mensagens 
${MENSAGEM_USUARIO_DELETADO_SUCESSO}    Usuário deletado com sucesso!. 
${MENSAGEM_USUARIO_NAO_EXISTE}    Esse usuário não existe em nossa base de dados.  
${MENSAGEM_CAMPO_EMAIL_OBRIGATORIO}    O campo e-mail é obrigatório.
${MENSAGEM_CAMPO_NOME_OBRIGATORIO}    O campo nome completo é obrigatório.
${MENSAGEM_CAMPO_NOME_COM_NUMEROS}    O campo nome completo não deve conter números
${MENSAGEM_CAMPO_NOME_INVALIDO}    Informe o nome e sobrenome com as iniciais em letra maiúscula e sem caracteres especiais.
#rotas 
${login_auth}    login

#novo usuario
${FULL_NAME}    EMPTY
${USER_EMAIL}    EMPTY
${USER_PASSWORD}    EMPTY
${ACESS_PROFILE}    ADMIN
${CPF}    EMPTY   
${USER_ID}    EMPTY

#GET count
${COUNT_ANTES}    EMPTY
${COUNT_DEPOIS}    EMPTY

#status code
${STATUS_200}    200
${STATUS_400}    400

