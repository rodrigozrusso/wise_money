# encoding: utf-8
# language: pt

  Funcionalidade: Cadastro
    Como usuario da Aplicacao
    Quero poder cadastrar Capitals na Aplicacao
    Para garantir que tenhamos uma Aplicacao com cadastro completo

  Cenario: Capital Listagem Vazia
    Dado que nao exista nenhum capital
    Quando acesso a listagem de capital
    Entao devo estar na listagem de capital
    E a pagina tem titulo "Capitais Busca"
    E a pagina tem as colunas "ID|Nome|Ações"
    E a pagina nao tem resultados "Nenhum Resultado Encontrado!"

  @smoke_test
  Cenario: Capital Listagem - botao Criacao
    Dado que nao exista nenhum capital
    Quando acesso a listagem de capital
    E clico no botao criacao
    Entao devo estar na criacao de capital

  @smoke_test
  Cenario: Capital Listagem 5 itens
    Dado que exista 5 capitais
    Quando acesso a listagem de capital
    Entao a pagina tem resultados
    E a pagina tem as capitais criadas
