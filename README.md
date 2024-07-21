Olá, este é um projeto de automação de api utilizando robot framework com RequestsLibrary. 

ainda estou na estapa de desenvolvimento então a estrutura do projeto está mudando sempre, por isso não irei adicionar muitos detalhes do projeto

Estrutura em pastas
 

├── logs
├── resources
│   ├── keywords
│   │   ├── keywords_gerais.robot (geração de massa)
│   │   │      
│   │   |── keywords_tests.robot (utilizadas nos testes)
│   │   | 
│   │   └── keywords_ultis.robot (pré requisitos)
│   │
│   ├── variables
│       ├── variables_globals.robot
│    
|── main.robot 
|
├── tests
|    ├── uers_tests
|         ├── DELETE_user.robot (geração de massa)
│         │      
│         |── GET_user.robot (utilizadas nos testes)
│         | 
│         └── POST_user.robot (pré requisitos)
|         | 
│         └── PUT_user.robot (pré requisitos)
|        
├── readme.md


