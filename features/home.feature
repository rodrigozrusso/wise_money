# encoding: utf-8
# language: pt

  Funcionalidade: Home
    Como usuario da Aplicacao
    Quero poder acessar a Home
    Para garantir as funcionalidades

  Cenario: Menu - Home
    Quando acesso "Home"
    Entao estou em "Home"
    E o menu ativo deve ser "Capitais"
    E clico no menu "WiseMoney"
    E estou em "Home"
    E o menu ativo deve ser "Capitais"

  Cenario: Menu - Capital
    Quando acesso "Home"
    Entao clico no menu "Capitais"
    E estou em "CapitalIndex"
    E o menu ativo deve ser "Capitais"

  Cenario: Menu - Transaction
    Quando acesso "Home"
    Entao clico no menu "Transações"
    E estou em "TransactionIndex"
    E o menu ativo deve ser "Transações"
