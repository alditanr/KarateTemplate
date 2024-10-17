Feature: Tasty

  Background:
    * url 'https://tasty.p.rapidapi.com/'
    * def apiKey = '6db102e398msh173358f0e9bf5ecp13ab0fjsn34d7ebdf84b9'
    * def wrongApiKey = '6db102e398msh173358f0e9bf5ecp13ab0fjsn34d7xxxxxxxx'
    * def apiHost = 'tasty.p.rapidapi.com'
    * def recipeId = '8138'
    * def listId = '3562'

  Scenario: Recipe List
    Given path 'recipes/list'
    And param from = '0'
    And param size = '20'
    And param tags = 'under_30_minutes'
    And header x-rapidapi-host = apiHost
    And header x-rapidapi-key = apiKey
    When method GET
    Then status 200
    And print response

  Scenario: Recipe List Wrong API Key
    Given path 'recipes/list'
    And param from = '0'
    And param size = '20'
    And param tags = 'under_30_minutes'
    And header x-rapidapi-host = apiHost
    And header x-rapidapi-key = wrongApiKey
    When method GET
    Then status 403
    And print response

  Scenario: Recipe List Similarities
    Given path 'recipes/list-similarities'
    And param recipe_id = recipeId
    And header x-rapidapi-host = apiHost
    And header x-rapidapi-key = apiKey
    When method GET
    Then status 200
    And print response

  Scenario: Recipe Get More Info
    Given path 'recipes/get-more-info'
    And param recipe_id = recipeId
    And header x-rapidapi-host = apiHost
    And header x-rapidapi-key = apiKey
    When method GET
    Then status 200
    And print response

  Scenario: Recipe Get More Info Wrong API Key
    Given path 'recipes/get-more-info'
    And param recipe_id = recipeId
    And header x-rapidapi-host = apiHost
    And header x-rapidapi-key = wrongApiKey
    When method GET
    Then status 403
    And print response

  Scenario: Tips List
    Given path 'tips/list'
    And param from = '0'
    And param size = '30'
    And param id = listId
    And header x-rapidapi-host = apiHost
    And header x-rapidapi-key = apiKey
    When method GET
    Then status 200
    And print response

  Scenario: Tag List
    Given path 'tags/list'
    And header x-rapidapi-host = apiHost
    And header x-rapidapi-key = apiKey
    When method GET
    Then status 200
    And print response

  Scenario: Tag List Wrong API Key
    Given path 'tags/list'
    And header x-rapidapi-host = apiHost
    And header x-rapidapi-key = wrongApiKey
    When method GET
    Then status 403
    And print response

  Scenario: Feeds List
    Given path 'feeds/list'
    And param size = '5'
    And param timezone = '%2B0700'
    And param vegetarian = 'false'
    And param from = '0'
    And header x-rapidapi-host = apiHost
    And header x-rapidapi-key = apiKey
    When method GET
    Then status 200
    And print response

  Scenario: Feeds List Wrong API Key
    Given path 'feeds/list'
    And param size = '5'
    And param timezone = '%2B0700'
    And param vegetarian = 'false'
    And param from = '0'
    And header x-rapidapi-host = apiHost
    And header x-rapidapi-key = wrongApiKey
    When method GET
    Then status 403
    And print response