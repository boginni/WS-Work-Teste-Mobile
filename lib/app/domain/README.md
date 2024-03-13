# Domain Layer

Essa parte da arquitetura é responsável por representar o domínio da aplicação. Aqui é onde fica as
regras de negócio, entidades, objetos de valor, serviços e interfaces que são utilizadas pela
aplicação. O ideal é que essa camada seja independente de qualquer outra camada, ou seja, ela não
deve depender
de nenhuma outra camada, e sim, as outras camadas que devem depender dela.

## Dto

Essa pasta é responsável por armazenar os objetos de transferência de dados (DTO) que são
utilizados.

### Entity

É responsável por armazenar as entidades que são utilizadas na aplicação, não deve conter nenhuma
lógica de negócio;=.

### Params

É responsável por armazenar os parâmetros que são utilizados na aplicação, não deve conter nenhuma
lógica de negócio.

## Errors

Essa pasta é responsável por armazenar os erros que são utilizados na aplicação.

## Providers

Essa pasta é responsável por armazenar os provedores que são utilizados na aplicação. providers
abstrai a lógica responsável por comunicação com serviços externos e retornam dados primivos, como
por exemplo, database, http e etc.

### Considerações

* **Dio**: O motivo pelo qual não há um provider que abstrai o dio, é porque esse pacote já é
  completo, fácil de criar mocks. Fazer isso não é necessáriamente errado pois se trata de conexões
  http. Os Interceptos, Client e Base Options do dio já permitem implementar qualquer
  funcionalidade, mas se for nessesário fazer algo muito especifico, é possível compensar com uma
  extension. É importante que o dio seja acessível pela camada de ui.

* **Database**: Do Pacote Nativo do sqflite, Esse pacote deveria ser abstraido um query builder, mas
  por questões de tempo, não criarei
  ou usarei algum pacote que abstraia o banco de dados. Entretanto, é fundamental ter uma abstração
  desse tipo pois permite seguir o Princípio de Open/Closed, para que seja possível trocar o banco
  de
  dados sem precisar alterar o código da aplicação.

* **Cache Provider**: Essa parte foi implementada, mas fiz de forma confusa, pois o cache provider
  deveria retornar os valores ainda em formato de dados primitivos ou json, e não em objetos, por
  isso foi iniciado uma conversão, mas não foi finalizada por limitações de tempo.

### Repositories

Extraido da arquitetura de clean code, o repositório é responsável por abstrair a
comunicação/conversão de dados entre a camada de domínio e a camada externa. O repositório é
fundamental para centralizar a lógica de acesso a dados, e para que a camada de ui não precise
saber de onde vem os dados, e como eles são armazenados.

### Services

Semelhante a repositórios, mas eles não são responsáveis por acessar dados, e sim, por executar uma
lógica de negócio e não necessariamente acessar dados.

### Use Cases

Use cases são responsáveis por executar uma tarefa especifica. Noralmente, a cada de ui só acessaria
os use cases, mas para esse projeto, decidi permitir que os controlers acessem os repositórios e
serviços diretamente.





