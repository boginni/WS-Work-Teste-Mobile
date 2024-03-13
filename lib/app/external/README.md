# External Layer

Também conhecida como camada de infraestrutura ou datasource, é a camada responsável por implementar
a comunicação com serviços externos, como por exemplo, banco de dados, APIs, sistemas de arquivos,
etc.

O ponto principal dessa camda é ter todos as classes sendo extensíveis e substituíveis, respeitando
os princípios de SOLID, principalmente o princípio de inversão de dependência. Dessa forma, a camada
de Ui não precisam saber como os dados são obtidos, apenas as interfaces.

