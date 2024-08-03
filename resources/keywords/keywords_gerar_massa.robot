*** Settings ***
Documentation    Arquivo com keywords de geração de massas
Resource    ../main.robot

*** Keywords ***
gerar_nome_aleatorio
    ${nome} =     Generate Random String    10    [LETTERS]
    ${sobrenome} =    Generate Random String    10    [LETTERS]
    ${nome_composto} =    Catenate    ${nome}    ${sobrenome}
    ${nome_personalizado} =    Evaluate    "${nome_composto}".title()
    RETURN   ${nome_personalizado}

gerar_nome_aleatorio_com_numeros
    ${nome} =     Generate Random String    10    [LETTERS]\[NUMBERS]
    RETURN   ${nome}

gerar_nome_aleatorio_minusculo
    ${nome} =     Generate Random String    10    [LOWER]
    RETURN   ${nome}

gerar_nome_aleatorio_caracters_especiais
    ${nome} =     Generate Random String    10    [LOWER]\@#$%
    RETURN   ${nome}

gerar_email_aleatorio
    ${nome} =     Generate Random String    10    [LOWER]
    ${dominio} =    Set Variable    @example.com
    ${email_personalizado} =    Catenate    ${nome}${dominio}
    RETURN    ${email_personalizado}

gerar_cpf_aleatorio
    ${cpf} =     Generate Random String    11    [NUMBERS]
    RETURN    ${cpf}

gerar_password_aleatorio
    #Senha precisa ter: uma letra maiúscula, uma letra minúscula, um número, um caractere especial(@#$%) e tamanho entre 8-12.
    ${password_numero} =     Generate Random String    3    [NUMBERS]
    ${password_letras}=    Generate Random String    2    [LOWER]
    ${password_letras1}=    Generate Random String    2    [UPPER]
    ${caracteres_especiais} =     Generate Random String    1    @#$%
    ${password}=    Catenate    ${password_numero}${caracteres_especiais}${password_letras}${password_letras1}
    RETURN    ${password}

gerar_nome_aleatorio_diretoria
    ${nome} =     Generate Random String    5    [LOWER]
    ${nome_personalizado} =    Evaluate    "${nome}".title()
    RETURN    ${nome_personalizado}
