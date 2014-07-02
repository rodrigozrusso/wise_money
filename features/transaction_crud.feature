# encoding: utf-8
# language: en

  Feature: Transaction CRUD
    In order to have the data up to date
    As a product owner
    I want to have a Transaction CRUD features

  @smoke_test
  Scenario: List page - info
    Given I am at 'TransactionIndex'
    Then the page title should be 'Transactions Search'
    And the page should has columns 'ID|Description|Status|Total|Checked At|Income Capital|Expense Capital|Actions'

  Scenario: List page - empty
    Given I am at 'TransactionIndex'
    Then the page should has no results with the message 'No results was found!'

  @smoke_test
  Scenario: List page - 5 items
    Given there are 'transaction_valid,transaction_with_income,transaction_with_expense,transaction_with_income_and_expense,transaction_light_bill' stored
    And I am at 'TransactionIndex'
    Then the page should list all the saved

  @smoke_test
  Scenario: List page - create button
    Given I am at 'TransactionIndex'
    When I click button 'New'
    Then I should be redirected to 'TransactionNew'

  @smoke_test
  Scenario: List page - show button
    Given there is 'transaction_valid' stored
    And I am at 'TransactionIndex'
    When I click button 'Show'
    Then I should be redirected to 'TransactionShow'

  @smoke_test
  Scenario: List page - edit button
    Given there is 'transaction_valid' stored
    And I am at 'TransactionIndex'
    When I click button 'Edit'
    Then I should be redirected to 'TransactionEdit'

  @smoke_test
  Scenario: Delete modal - info
    Given there is 'transaction_with_income_and_expense' stored
    And I am at 'TransactionIndex'
    When I click button 'Remove'
    Then the remove modal should be opened
    And the remove modal title should be 'Do you really want to remove?'
    And the remove modal should show the last saved

  @smoke_test
  Scenario: Delete modal - remove button
    Given there is 'transaction_valid' stored
    And I am at 'TransactionIndex'
    When I click button 'Remove'
    And I click button 'Remove!'
    Then I should be redirected to 'TransactionIndex'
    And I can see the success message 'Transaction was successfully destroyed.'
    And the page should has no results with the message 'No results was found!'

  Scenario: Delete modal - cancel button
    Given there is 'transaction_valid' stored
    And I am at 'TransactionIndex'
    When I click button 'Remove'
    And I click button 'Cancel'
    Then I should be redirected to 'TransactionIndex'
    And the page should list all the saved

  @smoke_test
  Scenario: Show page - info
    Given there is 'transaction_with_income_and_expense' stored
    And I am at 'TransactionShow' by the last saved
    Then the page title should be 'Transactions Show'
    And the page should show the last saved

  Scenario: Show page - back button
    Given there is 'transaction_valid' stored
    And I am at 'TransactionShow' by the last saved
    When I click button 'Back'
    Then I should be redirected to 'TransactionIndex'

  @smoke_test
  Scenario: Show page - edit button
    Given there is 'transaction_valid' stored
    And I am at 'TransactionShow' by the last saved
    When I click button 'Edit'
    Then I should be redirected to 'TransactionEdit'

  @smoke_test
  Scenario: Create page - info
    Given I am at 'TransactionNew'
    Then the page title should be 'Transactions New'

  @smoke_test
  Scenario: Create page - back button
    Given I am at 'TransactionNew'
    When I click button 'Back'
    Then I should be redirected to 'TransactionIndex'

  @smoke_test
  Scenario: Create page - save
    Given there is 'transaction_with_income_and_expense'
    And its 'income_capital' is stored
    And its 'expense_capital' is stored
    And I am at 'TransactionNew'
    And I fill the form with the last
    When I click button 'Save'
    Then I should be redirected to 'TransactionShow'
    And the page should show the last saved

  Scenario: Create page - validation empty fields
    Given I am at 'TransactionNew'
    When I click button 'Save'
    Then I should be redirected to 'TransactionNew'
    And I can see the error message 'Please review the problems below:'
    And I can see the validation message '* Description can't be blank|* Status can't be blank'

  Scenario: Create page - validation maximum lenght fields
    Given I am at 'TransactionNew'
    And I fill the form with 'transaction_maximum_lenght'
    When I click button 'Save'
    Then I should be redirected to 'TransactionNew'
    And I can see the error message 'Please review the problems below:'
    And I can see the validation message '* Description is too long (maximum is 150 characters)'

  @smoke_test
  Scenario: Edit page - info
    Given there is 'transaction_with_income_and_expense' stored
    And I am at 'TransactionEdit' by the last saved
    Then the page title should be 'Transactions Edit'
    And the page should show the last saved

  Scenario: Edit page - back button
    Given there is 'transaction_valid' stored
    And I am at 'TransactionEdit' by the last saved
    When I click button 'Back'
    Then I should be redirected to 'TransactionIndex'

  @smoke_test
  Scenario: Edit page - save
    Given there is 'transaction_with_income_and_expense' stored
    And there is 'transaction_light_bill'
    And its 'income_capital' is stored
    And I am at 'TransactionEdit' by the first saved
    And I fill the form with the last
    When I click button 'Save'
    Then I should be redirected to 'TransactionShow'
    And the page should show the last saved

  Scenario: Edit page - validation empty fields
    Given there is 'transaction_valid' stored
    And I am at 'TransactionEdit' by the last saved
    And I fill the form with ''
    When I click button 'Save'
    Then I should be redirected to 'TransactionEdit'
    And I can see the error message 'Please review the problems below:'
    And I can see the validation message '* Description can't be blank|* Status can't be blank'

  Scenario: Edit page - validation maximum lenght fields
    Given there is 'transaction_valid' stored
    And I am at 'TransactionEdit' by the last saved
    And I fill the form with 'transaction_maximum_lenght'
    When I click button 'Save'
    Then I should be redirected to 'TransactionEdit'
    And I can see the error message 'Please review the problems below:'
    And I can see the validation message '* Description is too long (maximum is 150 characters)'
