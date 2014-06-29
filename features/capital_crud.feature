# encoding: utf-8
# language: en

  Feature: Capital CRUD
    In order to have the data up to date
    As a product owner
    I want to have a Capital CRUD features

  @smoke_test
  Scenario: List page - info
    Given I am at 'CapitalIndex'
    Then the page title should be 'Capitals Search'
    And the page should has columns 'ID|Name|Actions'

  Scenario: List page - empty
    Given I am at 'CapitalIndex'
    Then the page should has no results with the message 'No results was found!'

  @smoke_test
  Scenario: List page - 5 items
    Given there are 5 'capital_valid'
    And I am at 'CapitalIndex'
    Then the page should list all the saved

  @smoke_test
  Scenario: List page - create button
    Given I am at 'CapitalIndex'
    When I click button 'New'
    Then I should be redirected to 'CapitalNew'

  @smoke_test
  Scenario: List page - show button
    Given there is 'capital_valid'
    And I am at 'CapitalIndex'
    When I click button 'Show'
    Then I should be redirected to 'CapitalShow'

  @smoke_test
  Scenario: List page - edit button
    Given there is 'capital_valid'
    And I am at 'CapitalIndex'
    When I click button 'Edit'
    Then I should be redirected to 'CapitalEdit'

  @smoke_test
  Scenario: Delete modal - info
    Given there is 'capital_valid'
    And I am at 'CapitalIndex'
    When I click button 'Remove'
    Then the remove modal should be opened
    And the remove modal title should be 'Do you really want to remove?'
    And the remove modal should show the last saved

  @smoke_test
  Scenario: Delete modal - remove button
    Given there is 'capital_valid'
    And I am at 'CapitalIndex'
    When I click button 'Remove'
    And I click button 'Remove!'
    Then I should be redirected to 'CapitalIndex'
    And I can see the success message 'Capital was successfully destroyed.'
    And the page should has no results with the message 'No results was found!'

  Scenario: Delete modal - cancel button
    Given there is 'capital_valid'
    And I am at 'CapitalIndex'
    When I click button 'Remove'
    And I click button 'Cancel'
    Then I should be redirected to 'CapitalIndex'
    And the page should list all the saved

  @smoke_test
  Scenario: Show page - info
    Given there is 'capital_valid'
    And I am at 'CapitalShow' by the last saved
    Then the page title should be 'Capitals Show'
    And the page should show the last saved

  Scenario: Show page - back button
    Given there is 'capital_valid'
    And I am at 'CapitalShow' by the last saved
    When I click button 'Back'
    Then I should be redirected to 'CapitalIndex'

  @smoke_test
  Scenario: Show page - edit button
    Given there is 'capital_valid'
    And I am at 'CapitalShow' by the last saved
    When I click button 'Edit'
    Then I should be redirected to 'CapitalEdit'

  @smoke_test
  Scenario: Create page - info
    Given I am at 'CapitalNew'
    Then the page title should be 'Capitals New'

  @smoke_test
  Scenario: Create page - back button
    Given I am at 'CapitalNew'
    When I click button 'Back'
    Then I should be redirected to 'CapitalIndex'

  @smoke_test
  Scenario: Create page - save
    Given I am at 'CapitalNew'
    And I fill the form with 'capital_valid'
    When I click button 'Save'
    Then I should be redirected to 'CapitalShow'
    And the page should show the last saved

  Scenario: Create page - validation empty fields
    Given I am at 'CapitalNew'
    When I click button 'Save'
    Then I should be redirected to 'CapitalNew'
    And I can see the error message 'Please review the problems below:'
    And I can see the validation message '* Name can't be blank'

  Scenario: Create page - validation unicity
    Given there is 'capital_valid'
    And I am at 'CapitalNew'
    And I fill the form with the last saved
    When I click button 'Save'
    Then I should be redirected to 'CapitalNew'
    And I can see the error message 'Please review the problems below:'
    And I can see the validation message '* Name has already been taken'

  @smoke_test
  Scenario: Edit page - info
    Given there is 'capital_valid'
    And I am at 'CapitalEdit' by the last saved
    Then the page title should be 'Capitals Edit'
    And the page should show the last saved

  Scenario: Edit page - back button
    Given there is 'capital_valid'
    And I am at 'CapitalEdit' by the last saved
    When I click button 'Back'
    Then I should be redirected to 'CapitalIndex'

  @smoke_test
  Scenario: Edit page - save
    Given there is 'capital_valid'
    And I am at 'CapitalEdit' by the last saved
    And I fill the form with 'capital_saving_account'
    When I click button 'Save'
    Then I should be redirected to 'CapitalShow'
    And the page should show the last saved

  Scenario: Edit page - validation empty fields
    Given there is 'capital_valid'
    And I am at 'CapitalEdit' by the last saved
    And I fill the form with ''
    When I click button 'Save'
    Then I should be redirected to 'CapitalEdit'
    And I can see the error message 'Please review the problems below:'
    And I can see the validation message '* Name can't be blank'

  Scenario: Edit page - validation unicity
    Given there is 'capital_saving_account,capital_valid'
    And I am at 'CapitalEdit' by the last saved
    And I fill the form with 'capital_saving_account'
    When I click button 'Save'
    Then I should be redirected to 'CapitalEdit'
    And I can see the error message 'Please review the problems below:'
    And I can see the validation message '* Name has already been taken'
