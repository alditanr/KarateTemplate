Feature: Ingridients

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = 'fb98bf8b0baa4e7e9eb1db36b92cfbc2'
    * def wrongAPIKey = 'wr0ng4P1K3Y'
    * def hash = 'c15f6e11b633ea38fb713e1fdbdb534e0b87793c'
    * def username = 'mardiyah-rizka'
    * def ingredientID = 93671

  Scenario: Get Ingredient Search
    Given path 'food/ingredients/search'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param query = "banana"
    And param addChildren = true
    And param minProteinPercent = 5
    And param sortDirection = "asc"
    And param number = 2
    When method get
    Then status 200
    And print response


  Scenario: Get Ingredient Information
    Given path 'food/ingredients', ingredientID, 'information'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param id = ingredientID
    And param units = "grams"
    When method get
    Then status 200
    And print response

  Scenario: Post Parse Ingredients
    Given path 'recipes/parseIngredients'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And param apiKey = apiKey
    And param ingredientList = "1 cup green tea"
    And param servings = 1
    And param includeNutrition = true
    When method post
    Then status 200
    And print response

  Scenario: Compute Ingredient Amount
    Given path 'food/ingredients', ingredientID, 'amount'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param id = ingredientID
    And param nutrient = "protein"
    And param target = 10
    And param unit = "oz"
    When method get
    Then status 200
    And print response


  Scenario: Get Ingredient Substitutes
    Given path 'food/ingredients/substitutes'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param ingredientName = "butter"
    When method get
    Then status 200
    And print response


  Scenario: Get Ingredient Substitutes by ID
    Given path 'food/ingredients', ingredientID, 'substitutes'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param id = ingredientID
    When method get
    Then status 200
    And print response


  Scenario: Get Ingredient Search - Wrong API Key
    Given path 'food/ingredients/search'
    And header Content-Type = 'application/json'
    And param apiKey = wrongAPIKey
    And param query = "banana"
    And param addChildren = true
    And param minProteinPercent = 5
    And param sortDirection = "asc"
    And param number = 2
    When method get
    Then status 401
    And print response


  Scenario: Get Ingredient Information - Wrong API Key
    Given path 'food/ingredients', ingredientID, 'information'
    And header Content-Type = 'application/json'
    And param apiKey = wrongAPIKey
    And param id = ingredientID
    And param units = "grams"
    When method get
    Then status 401
    And print response


  Scenario: Compute Ingredient Amount - Wrong API Key
    Given path 'food/ingredients', ingredientID, 'amount'
    And header Content-Type = 'application/json'
    And param apiKey = wrongAPIKey
    And param id = ingredientID
    And param nutrient = "protein"
    And param target = 10
    And param unit = "oz"
    When method get
    Then status 401
    And print response


  Scenario: Get Ingredient Substitutes - Wrong API Key
    Given path 'food/ingredients/substitutes'
    And header Content-Type = 'application/json'
    And param apiKey = wrongAPIKey
    And param ingredientName = "butter"
    When method get
    Then status 401
    And print response


  Scenario: Get Ingredient Substitutes by ID - Wrong API Key
    Given path 'food/ingredients', ingredientID, 'substitutes'
    And header Content-Type = 'application/json'
    And param apiKey = wrongAPIKey
    And param id = ingredientID
    When method get
    Then status 401
    And print response