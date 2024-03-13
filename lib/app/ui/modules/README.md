# Modules

Esse diretório é responsável por armazenar os módulos da aplicação. em teoria, cada módulo poderia
ser um pacote separado, mas isso exigiria rever um pouca a estrutura do projeto, isso também
consumiria mais tempo para implementar e testar, então por enquanto, vamos manter tudo junto.

## Gereciamento de Estado

Cada módulo é responsável por gerenciar seu próprio estado, isso é feito atráves do uso de
controlers e ChangeNotifier, que são classes com nome Controller e State respectivamente. 
* **Controller**: Responsável pela lógica de interface com o usuário e acessa os repositórios.
* **State**: Responsável por armazenar o estado da interface com o usuário e notificar os observadores

