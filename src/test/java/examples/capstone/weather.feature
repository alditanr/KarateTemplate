Feature: Weather

  Background:
    * url 'https://api.openweathermap.org/data/2.5/weather'
    * def apiKey = '774063a2abc9af369a8480cff2930760'
    * def latValue = '-6.2131419'
    * def lonValue = '106.7767268'

  Scenario: Get Call current weather data
    Given param apiKey = apiKey
    And param lat = latValue
    And param lon = lonValue
    And param exclude = "hourly,daily"
    And param appid = apiKey
    When method get
    Then status 200
    And print response
    And match response.weather != null

  Scenario: Get Geocoding By City Name
    Given param q = 'London'
    And param appid = apiKey
    When method GET
    Then status 200
    And print response
#    And json path '$["name"]' equals 'London'

  Scenario: Get Geocoding By City ID
    Given param id = '2643743'
    And param appid = apiKey
    When method GET
    Then status 200
    And print response

  Scenario: Get Geocoding By ZIP code
    Given param apiKey = apiKey
    And param appid = apiKey
    And param zip = 10260
    And param units = "standard"
    When method get
    Then status 200
    And print response
