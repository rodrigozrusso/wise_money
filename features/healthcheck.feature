# encoding: utf-8
# language: en

  Feature: Application Healthcheck
    In order to have the application monitored
    As a devops team
    I want to have a healthcheck service

  @smoke_test
  Scenario: Healthcheck Service
    When I call the healthcheck service
    Then the result should be '{"ok":{"Healthchecks::Database":"OK"}}'
    And the http code should be 200
