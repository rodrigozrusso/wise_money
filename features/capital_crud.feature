# encoding: utf-8
# language: pt

  Funcionalidade: Cadastro
    Como usuario da Aplicacao
    Quero poder cadastrar Capitais
    Para garantir um cadastro completo

  Cenario: Listagem - vazia
    Dado que nao exista nenhum capital
    Quando acesso a listagem de capital
    Entao devo estar na listagem de capital
    E a pagina tem titulo "Capitais Busca"
    E a pagina tem as colunas "ID|Nome|Ações"
    E a pagina nao tem resultados "Nenhum Resultado Encontrado!"

  @smoke_test
  Cenario: Listagem - botao criacao
    Dado que nao exista nenhum capital
    Quando acesso a listagem de capital
    E clico no botao criacao
    Entao devo estar na criacao de capital

  @smoke_test
  Cenario: Listagem - 5 itens
    Dado que exista 5 capitais
    Quando acesso a listagem de capital
    Entao a pagina tem resultados
    E a pagina tem as capitais criadas

  @smoke_test
  Cenario: Listagem - botao detalhes
    Dado que exista 1 capital
    Quando acesso a listagem de capital
    E clico no botao 1 detalhe
    Entao devo estar no detalhe de capital

  @smoke_test
  Cenario: Listagem - botao edicao
    Dado que exista 1 capital
    Quando acesso a listagem de capital
    E clico no botao 1 edicao
    Entao devo estar na edicao de capital

  Cenario: Listagem - botao remocao
    Dado que exista 1 capital
    Quando acesso a listagem de capital
    E clico no botao 1 remover
    Entao o modal de remocao abre
    E o modal tem no titulo "Você Realmente Deseja Remover?"
    E o modal tem no conteudo o capital criado 1

  @smoke_test
  Cenario: Listagem - botao remocao - confirmada
    Dado que exista 1 capital
    Quando acesso a listagem de capital
    E clico no botao 1 remover
    Entao o modal de remocao abre
    E confirmo a remocao
    E devo estar na listagem de capital
    E a pagina nao tem resultados "Nenhum Resultado Encontrado!"

  Cenario: Listagem - botao remocao - cancelada
    Dado que exista 1 capital
    Quando acesso a listagem de capital
    E clico no botao 1 remover
    Entao o modal de remocao abre
    E cancelo a remocao
    E devo estar na listagem de capital
    E a pagina tem as capitais criadas
