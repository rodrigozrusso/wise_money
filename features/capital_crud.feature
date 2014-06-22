# encoding: utf-8
# language: pt

  Funcionalidade: Cadastro de Capitais
    Como usuario da Aplicacao
    Quero poder cadastrar Capitais
    Para garantir um cadastro completo

  Cenario: Listagem - vazia
    Dado que nao exista nenhum "Capital"
    Quando acesso "CapitalIndex"
    Entao estou em "CapitalIndex"
    E a pagina tem titulo "Capitais Busca"
    E a pagina tem as colunas "ID|Nome|Ações"
    E a pagina nao tem resultados "Nenhum Resultado Encontrado!"

  @smoke_test
  Cenario: Listagem - botao criacao
    Dado que nao exista nenhum "Capital"
    Quando acesso "CapitalIndex"
    E clico no botao "Nova(o)"
    Entao estou em "CapitalNew"

  @smoke_test
  Cenario: Listagem - 5 itens
    Dado que exista apenas 5 "Capital" do tipo "capital_valid"
    Quando acesso "CapitalIndex"
    Entao a pagina tem resultados
    E a pagina tem as capitais criadas

  @smoke_test
  Cenario: Listagem - botao detalhes
    Dado que exista apenas 1 "Capital" do tipo "capital_valid"
    Quando acesso "CapitalIndex"
    E clico no botao 1 "Detalhes"
    Entao estou em "CapitalShow"

  @smoke_test
  Cenario: Listagem - botao edicao
    Dado que exista apenas 1 "Capital" do tipo "capital_valid"
    Quando acesso "CapitalIndex"
    E clico no botao 1 "Editar"
    Entao estou em "CapitalEdit"

  @smoke_test
  Cenario: Listagem - botao remocao
    Dado que exista apenas 1 "Capital" do tipo "capital_valid"
    Quando acesso "CapitalIndex"
    E clico no botao 1 "Remover"
    Entao o modal de remocao abre
    E o modal tem no titulo "Você Realmente Deseja Remover?"
    E o modal tem no conteudo o capital criado 1

  @smoke_test
  Cenario: Listagem - botao remocao - confirmada
    Dado que exista apenas 1 "Capital" do tipo "capital_valid"
    Quando acesso "CapitalIndex"
    E clico no botao 1 "Remover"
    Entao o modal de remocao abre
    E clico no botao "Remover!"
    E devo ver a mensagem de sucesso "Capital was successfully destroyed."
    E estou em "CapitalIndex"
    E a pagina nao tem resultados "Nenhum Resultado Encontrado!"

  Cenario: Listagem - botao remocao - cancelada
    Dado que exista apenas 1 "Capital" do tipo "capital_valid"
    Quando acesso "CapitalIndex"
    E clico no botao 1 "Remover"
    Entao o modal de remocao abre
    E clico no botao "Cancelar"
    E estou em "CapitalIndex"
    E a pagina tem as capitais criadas

  Cenario: Detalhes - informacoes
    Dado que exista apenas 1 "Capital" do tipo "capital_valid"
    Quando acesso "CapitalShow" pelo id do ultimo
    Entao estou em "CapitalShow"
    E a pagina tem titulo "Capitais Detalhes"
    E a pagina tem os detalhes da capital 1

  Cenario: Detalhes - botao voltar
    Dado que exista apenas 1 "Capital" do tipo "capital_valid"
    Quando acesso "CapitalShow" pelo id do ultimo
    E clico no botao "Voltar"
    Entao estou em "CapitalIndex"

  Cenario: Detalhes - botao editar
    Dado que exista apenas 1 "Capital" do tipo "capital_valid"
    Quando acesso "CapitalShow" pelo id do ultimo
    E clico no botao "Editar"
    Entao estou em "CapitalEdit"

  Cenario: Criacao - informacoes
    Dado que nao exista nenhum "Capital"
    Quando acesso "CapitalNew"
    Entao estou em "CapitalNew"
    E a pagina tem titulo "Capitais Nova(o)"

  Cenario: Edicao - informacoes
    Dado que exista apenas 1 "Capital" do tipo "capital_valid"
    Quando acesso "CapitalEdit" pelo id do ultimo
    Entao estou em "CapitalEdit"
    E a pagina tem titulo "Capitais Edição"
    E a pagina tem os detalhes da capital 1
