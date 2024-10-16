Feature: Get User Hash and Uname

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '8fd0ff5b3ea446d8a45af23f6e2d0967'

  Scenario: Get username and hash from connect user
    Given path 'users/connect'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And request {"username": "alditanr", "firstName": "Aldita", "lastName": "Nurrahmadiani", "email": "nyalditanr@gmail.com"}
    When method POST
    Then status 200
    And print response