Feature: Other feature that use bearer token

  Background:
    * def token = karate.get('bearerToken')
    * def authHeader = {Authorization: 'Bearer' + token}

  Scenario:
    Given url 'https://blaba.com'
    And headers authHeader
#    When method 'GET'
#    Then status 200
#    And jsonpath '$.message' == 'Hello, World!'