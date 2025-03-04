# FinaFlow
Projeto de aplicativo móvel em Flutter, o objetivo do aplicativo é a organização financeira!

## Funcionalidades
   
   - Login
   - Cadastro
   - Recuperar senha
   - Redirecionamento de Telas
   - Armazenar os Usuários e acessos no painel do Firabase
   - Subir e restaurar imagem do perfil pela camera ou pela galeria do app

## Tópicos

### Dependencias 

- get
    - Navegação de telas
    - Gerenciamento de dependências (bind e Controller)
    - Observers e Gerenciamento de Estado (Counter - item a ser observado)

- Firabase related
   firebase_auth: ^5.4.2
   firebase_core: ^3.11.0
   firebase_ui_auth: ^1.16.1
   firebase_ui_localizations: ^1.13.1

- image_picker: 1.1.2

- Formatação:
  intl: ^0.19.0
    

### Ícones de Carregamento

- Ícones de carregamento (Android, iOS ou Web)
- Miniatura do app no celular
- Comandos:
    ``` 
    flutter pub get (Atualiza as dependências)
    flutter pub run flutter_launcher_icons (Executa a geração dos ícones)
    ```  

### Splash Screen

    - Tela de inicialização dos apps
    - Geralmente tem a logo da empresa ou app


### Autenticação

    - Comunica com um servidor externo para realizar a autenticação.
    - Identificação do usuário e redirecionamento para a aplicação.
    - Restaurar o usuário que já fez o login anteriormente na aplicação.


### Handle de Imagens
    - Subir as imagens e restaurar elas do storage

### Home Screen

    - Funcionalidade principal do aplicativo: Salvar as Despesas mensais 

    