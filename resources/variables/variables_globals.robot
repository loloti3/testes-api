
*** Settings ***
Resource    ../main.robot

*** Variables ***
${EMPTY}    EMPTY

${URL_SUITS}    https://suits.qacoders-academy.com.br
${EMAIL_ADMIN}    sysadmin@qacoders.com    
${PASSWORD_ADMIN}    1234@Test
${TOKEN}    EMPTY

#Mensagems 
${MENSAGEM_USUARIO_DELETADO_SUCESSO}    Usuário deletado com sucesso!. 
${MENSAGEM_USUARIO_NAO_EXISTE}    Esse usuário não existe em nossa base de dados.  

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

