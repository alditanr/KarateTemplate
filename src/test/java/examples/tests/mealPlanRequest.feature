Feature: Test Get Meal Plan

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '8fd0ff5b3ea446d8a45af23f6e2d0967'
    * def hash = '9b3b3709fafacc58403d9a510bbd2c0490b0d979'
    * def username = 'alditanr'
    * def startDate = '2024-10-01'

  Scenario: Test Generate Meal Plan
    Given path 'mealplanner/generate'
    And param apiKey = apiKey
    And param timeFrame = 'day'
    And param targetCalories = '1000'
    When method get
    Then status 200
    And print response

  Scenario: Adding items to meal plan
    Given path 'mealplanner', username, 'items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request {"date": 1719500800, "slot": 1, "position": 0, "type": "INGREDIENTS", "value": { "ingredients": [ { "name": "1 banana" } ] } }
    When method post
    Then status 200
    And match response.status == 'success'
    And print response

  Scenario: Adding items to Shopping List
    Given path 'mealplanner', username, 'shopping-list', 'items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request { "item": "1 package baking powder", "aisle": "Baking", "parse": true }
    When method post
    Then status 200
    And print response

  Scenario: Get shopping list
    Given path 'mealplanner', username, 'shopping-list'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print response

  Scenario: ML Model Image Classification
    Given path 'food/images/classify'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param imageUrl = 'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2024/05/bahaya-mengonsumsi-durian-berlebihan.jpeg?fit=780%2C438&ssl=1'
    When method get
    Then status 200
    And print response