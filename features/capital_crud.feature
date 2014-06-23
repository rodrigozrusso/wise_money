# encoding: utf-8
# language: pt

  Funcionalidade: Cadastro de Capitais
    Como usuario da Aplicacao
    Quero poder cadastrar Capitais
    Para garantir um cadastro completo

  Cenario: Listagem - info
    Dado acesso "CapitalIndex"
    Entao a pagina tem titulo "Capitais Busca"
    E a pagina tem as colunas "ID|Nome|Ações"

  Cenario: Listagem - vazia
    Dado acesso "CapitalIndex"
    Entao a pagina nao tem resultados "Nenhum Resultado Encontrado!"

  @smoke_test
  Cenario: Listagem - 5 itens
    Dado exista 5 "capital_valid"
    E acesso "CapitalIndex"
    Entao a pagina lista os capitais criadas

  @smoke_test
  Cenario: Listagem - botao criacao
    Dado acesso "CapitalIndex"
    Quando clico no botao "Nova(o)"
    Entao vou para "CapitalNew"

  @smoke_test
  Cenario: Listagem - botao detalhes
    Dado exista "capital_valid"
    E acesso "CapitalIndex"
    Quando clico no botao "Detalhes" 1
    Entao vou para "CapitalShow"

  @smoke_test
  Cenario: Listagem - botao edicao
    Dado exista "capital_valid"
    E acesso "CapitalIndex"
    Quando clico no botao "Editar" 1
    Entao vou para "CapitalEdit"

  @smoke_test
  Cenario: Modal Delete - info
    Dado exista "capital_valid"
    E acesso "CapitalIndex"
    Quando clico no botao "Remover" 1
    Entao o modal de remocao abre
    E o modal de remocao tem titulo "Você Realmente Deseja Remover?"
    E o modal de remocao tem o capital criado 1

  @smoke_test
  Cenario: Modal Delete - botao remover
    Dado exista "capital_valid"
    E acesso "CapitalIndex"
    Quando clico no botao "Remover" 1
    E clico no botao "Remover!"
    Entao vou para "CapitalIndex"
    Entao vejo a mensagem de sucesso "Capital was successfully destroyed."
    E a pagina nao tem resultados "Nenhum Resultado Encontrado!"

  Cenario: Modal Delete - botao cancelar
    Dado exista "capital_valid"
    E acesso "CapitalIndex"
    Quando clico no botao "Remover" 1
    E clico no botao "Cancelar"
    Entao vou para "CapitalIndex"
    Entao a pagina lista os capitais criadas

  Cenario: Detalhes - info
    Dado exista "capital_valid"
    E acesso "CapitalShow" pelo id
    Entao a pagina tem titulo "Capitais Detalhes"
    E a pagina detalha o capital

  Cenario: Detalhes - botao voltar
    Dado exista "capital_valid"
    E acesso "CapitalShow" pelo id
    Quando clico no botao "Voltar"
    Entao vou para "CapitalIndex"

  Cenario: Detalhes - botao editar
    Dado exista "capital_valid"
    E acesso "CapitalShow" pelo id
    Quando clico no botao "Editar"
    Entao vou para "CapitalEdit"

  Cenario: Criacao - info
    Dado acesso "CapitalNew"
    Entao a pagina tem titulo "Capitais Nova(o)"

  Cenario: Criacao - botao voltar
    Dado acesso "CapitalNew"
    Quando clico no botao "Voltar"
    Entao vou para "CapitalIndex"

  Cenario: Criacao - salvar
    Dado acesso "CapitalNew"
    E preencho o formulario com "capital_valid"
    Quando clico no botao "Salvar"
    Entao vou para "CapitalShow"
    E a pagina detalha o capital

  Cenario: Criacao - validacao vazio
    Dado acesso "CapitalNew"
    Quando clico no botao "Salvar"
    Entao vou para "CapitalNew"
    E vejo a mensagem de erro "Alguns erros foram encontrados, por favor verifique:"
    E vejo as mensagens de validacao "* Nome não pode ficar em branco"

  Cenario: Criacao - validacao unicidade
    Dado exista "capital_valid"
    E acesso "CapitalNew"
    E preencho o formulario com modelo criado
    Quando clico no botao "Salvar"
    Entao vou para "CapitalNew"
    E vejo a mensagem de erro "Alguns erros foram encontrados, por favor verifique:"
    E vejo as mensagens de validacao "* Nome já está em uso"

  Cenario: Edicao - info
    Dado exista "capital_valid"
    E acesso "CapitalEdit" pelo id
    Entao a pagina tem titulo "Capitais Edição"
    E a pagina detalha o capital

  Cenario: Edicao - botao voltar
    Dado exista "capital_valid"
    E acesso "CapitalEdit" pelo id
    Quando clico no botao "Voltar"
    Entao vou para "CapitalIndex"

  Cenario: Edicao - salvar
    Dado exista "capital_valid"
    E acesso "CapitalEdit" pelo id
    E preencho o formulario com "capital_saving_account"
    Quando clico no botao "Salvar"
    Entao vou para "CapitalShow"
    E a pagina detalha o capital

  Cenario: Edicao - validacao vazio
    Dado exista "capital_valid"
    E acesso "CapitalEdit" pelo id
    E preencho o formulario com ""
    Quando clico no botao "Salvar"
    Entao vou para "CapitalEdit"
    E vejo a mensagem de erro "Alguns erros foram encontrados, por favor verifique:"
    E vejo as mensagens de validacao "* Nome não pode ficar em branco"

  Cenario: Edicao - validacao unicidade
    Dado exista "capital_saving_account,capital_valid"
    E acesso "CapitalEdit" pelo id
    E preencho o formulario com "capital_saving_account"
    Quando clico no botao "Salvar"
    Entao vou para "CapitalEdit"
    E vejo a mensagem de erro "Alguns erros foram encontrados, por favor verifique:"
    E vejo as mensagens de validacao "* Nome já está em uso"
