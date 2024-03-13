# Migrations

As migrations são responsáveis por criar e alterar a estrutura do banco de dados. elas fazem parte
de um conjunto de boas práticas para manter a integridade do banco de dados e facilitar a
manutenção.

Eu acho que sqlite é overkill para maioria dos projetos mobile, mas em caso de apps como força de
vendas, ou apps de uso em campo, é uma boa opção.

## Como usar

Nesse Projeto, há três classes que compõem a estrutura de uma migration:

* **Migration**: Classe abstrata que fornece o contrato a ser seguido pelas migrations.
* **MigrationConnection**: Serve como abstração do banco de dados, garantindo que independente do
  banco
  de dados, as migrations funcionarão.
* **MigrationService**: Classe que é responsável por executar as migrations ou derrubar elas.

## Considerações

Geralmente, em frameworks, migrations compõem uma fração das ferramentas de gerenciamento de banco
de dados, nesse projeto, implementei apenas o básico, mas, se fosse necessário, também implementaria
os outros tipos de serviços como Seeders, Backups, etc.
