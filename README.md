# Projeto de Testes Automatizados
Olá, este é um projeto de automação de api utilizando robot framework com RequestsLibrary. 


## Depedencias
    Python versão 3.12.1
    Robot Framework
    Bibliotecas utilizadas :
        Collections
        RequestsLibrary
        String
        akerLibrary   
        yamllibrary

## Estrutura de Pastas

```plaintext
├── logs
├── resources   
|   |       
│   ├── bodys
│   |    └── user_body.resource
|   |
│   ├── fixtures
│   │   ├── config.yaml          
│   │   ├── mensagens.yaml           
│   │   └── user.yaml
|   |
│   ├── utils
│   │   ├── keywords_gerar_massa.resource       
│   │   ├── keyworda_utils.resource         
│   │   └── variables.resource
|   |
├   ├──  main.robot
|
├── tests
│   ├── users
│       ├── DELETE_user.robot              
│       ├── GET_user.robot                 
│       ├── POST_user.robot                
│       └── PUT_user.robot                 
└── readme.md



