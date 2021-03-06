# encoding: utf-8
# language: en

  Feature: Menu
    In order to have easy links
    As a product owner
    I want to have a menu on the top

  Scenario: Menu - info
    Given I am at 'Home'
    Then the active menu should be 'Capitals'
    And the menu has 'Capitals|Transactions'

  @smoke_test
  Scenario Outline: Menu - links
    Given I am at 'Home'
    When I click at menu '<link>'
    Then I should be redirected to '<page>'
    And the active menu should be '<active_menu>'

    Examples:
      |link|page|active_menu|
      |WiseMoney|Home|Capitals|
      |Capitals|CapitalIndex|Capitals|
      |Transactions|TransactionIndex|Transactions|
