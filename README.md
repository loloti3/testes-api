Olá, este é um projeto de automação de api utilizando robot framework com RequestsLibrary. 

ainda estou na estapa de desenvolvimento então a estrutura do projeto está mudando sempre, por isso não irei adicionar muitos detalhes do projeto

Estrutura em pastas
 
 docs -- contém os casos de teste documentados 

 resources -- contém tudo que é nescessário para realizar os testes 
    |    |
    |    |
    |    --keywords --contém as keywords genéricas para relizar os testes (geração de massa, teste setup e as sessões de cada rota)
    |    |
    |    |
    |    --keywords_pages --contém as keywords especificas de cada caso de teste (planejo retirar esta pasta para deixar o arquivo menor) 
    |    |
    |    |
    |    --variables -- contém as as varivéis blobais dos testes
    |
    --main -- contém os arquivos e blibliotecas nescessários para realizar os testes

 testes -- contém todos os casos de teste separados por rota



