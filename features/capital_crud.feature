# encoding: utf-8
# language: pt

  Funcionalidade: Cadastro de Capitais
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
    E clico no botao "Nova(o)"
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
    E clico no botao 1 "Detalhes"
    Entao devo estar no detalhe de capital

  @smoke_test
  Cenario: Listagem - botao edicao
    Dado que exista 1 capital
    Quando acesso a listagem de capital
    E clico no botao 1 "Editar"
    Entao devo estar na edicao de capital

  @smoke_test
  Cenario: Listagem - botao remocao
    Dado que exista 1 capital
    Quando acesso a listagem de capital
    E clico no botao 1 "Remover"
    Entao o modal de remocao abre
    E o modal tem no titulo "Você Realmente Deseja Remover?"
    E o modal tem no conteudo o capital criado 1

  @smoke_test
  Cenario: Listagem - botao remocao - confirmada
    Dado que exista 1 capital
    Quando acesso a listagem de capital
    E clico no botao 1 "Remover"
    Entao o modal de remocao abre
    E clico no botao "Remover!"
    E devo ver a mensagem de sucesso "Capital was successfully destroyed."
    E devo estar na listagem de capital
    E a pagina nao tem resultados "Nenhum Resultado Encontrado!"

  Cenario: Listagem - botao remocao - cancelada
    Dado que exista 1 capital
    Quando acesso a listagem de capital
    E clico no botao 1 "Remover"
    Entao o modal de remocao abre
    E clico no botao "Cancelar"
    E devo estar na listagem de capital
    E a pagina tem as capitais criadas

  Cenario: Detalhes - informacoes
    Dado que exista 1 capital
    Quando acesso os detalhes de capital 1
    Entao devo estar no detalhe de capital
    E a pagina tem titulo "Capitais Detalhes"
    E a pagina tem os detalhes da capital 1

  Cenario: Detalhes - botao voltar
    Dado que exista 1 capital
    Quando acesso os detalhes de capital 1
    E clico no botao "Voltar"
    Entao devo estar na listagem de capital

  Cenario: Detalhes - botao editar
    Dado que exista 1 capital
    Quando acesso os detalhes de capital 1
    E clico no botao "Editar"
    Entao devo estar na edicao de capital

  Cenario: Criacao - informacoes
    Dado que nao exista nenhum capital
    Quando acesso a criacao de capital
    Entao devo estar na criacao de capital
    E a pagina tem titulo "Capitais Nova(o)"

  Cenario: Edicao - informacoes
    Dado que exista 1 capital
    Quando acesso a edicao de capital 1
    Entao devo estar na edicao de capital
    E a pagina tem titulo "Capitais Edição"
    E a pagina tem os detalhes da capital 1
