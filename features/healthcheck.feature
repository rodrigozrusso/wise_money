# encoding: utf-8
# language: pt

  Funcionalidade: Healthcheck da Aplicacao
    Como Devops da Aplicacao
    Quero que a aplicacao responda o servico de healthcheck
    Para garantir que tenhamos a aplicacao monitorada

  @smoke_test
  Cenario: Servico de Healthcheck
    Quando eu chamo o servico de healthcheck
    Entao o response deve conter "{"ok":{"Healthchecks::Database":"OK"}}"
    E o response deve ter http code 200
