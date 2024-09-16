*** Settings ***
Resource    ../main.robot


*** Keywords ***
Body User
    Massa Body user  
    ${body}=    Create Dictionary
    ...    fullName=${full_name}
    ...    mail=${user_email}
    ...    password=${user_password}
    ...    accessProfile=${access_profile['admin']}
    ...    cpf=${cpf}
    ...    confirmPassword=${user_password} 
         
    RETURN    ${body}