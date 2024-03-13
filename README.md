# WS-Work-Teste-Mobile

O teste para a vaga de desenvolvedor mobile da WS Work. o aplicativo foi desenvolvido em flutter, e
segue a arquitetura de clean code, respeitando todos os princípios de SOLID.

## Decições técnicas

As principais decições estão descritas em cada arquivo README.md, dentro das pastas do projeto.

## Detalhes principais

* **Arquitetura**: Clean Code
* **Linguagem**: Dart
* **Framework**: Flutter
* **Gerenciamento de Estado**: ChangeNotifier
* **Testes**: Testes Unitários e Testes de Widgets
* **Padrões de Projeto**: Repository, Service, DTO, Failures, Controller, Store
  Providers

## Funcionalidades

* **Autenticação**: Login de Email e Anonima.
* **Confirmação de Email**.
* **Recuperação de Senha**.
* **Listagem de Veiculos**.
* **Requisição Offline**: Cacheia a listagem para exibir offline.
* **Idiomas**: Suporte para Português, Inglês, Espanhol, Francês, Alemão e Japonês.
* **Tema**: Suporte a Tema Escuro e Claro.
* **Testes**: Testes Unitários e Testes de Widgets.
* **Crashlytics**

## Como executar

* **Requisitos**: Flutter >=3.3.0 <4.0.0 e Projeto configurado com Autenticação de Email e Anonima

1. Clone o repositório

```
git clone https://github.com/boginni/WS-Work-Teste-Mobile.git
```

2. Configure o projeto com o Firebase, precisa ter Autenticação de Email e Anonima

```
flutterfire configure
```

3. Resolva as dependências do projeto

```
flutter pub get
```

4. Execute o projeto

```
flutter run
```
