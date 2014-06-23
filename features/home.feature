# encoding: utf-8
# language: pt

  Funcionalidade: Home
    Como usuario da Aplicacao
    Quero poder acessar a Home
    Para garantir as funcionalidades

  Cenario: Home - info
    Dado acesso "Home"
    Entao o menu ativo deve ser "Capitais"

  Cenario: Menu - Home
    Dado acesso "Home"
    Quando clico no menu "WiseMoney"
    E vou para "Home"
    E o menu ativo deve ser "Capitais"

  Cenario: Menu - Capital
    Dado acesso "Home"
    Quando clico no menu "Capitais"
    E vou para "CapitalIndex"
    E o menu ativo deve ser "Capitais"

  Cenario: Menu - Transaction
    Dado acesso "Home"
    Quando clico no menu "Transações"
    E vou para "TransactionIndex"
    E o menu ativo deve ser "Transações"
