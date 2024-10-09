Feature: PET API Test - User

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API--"

  Scenario: Create User
    * def reqBody = {"id": 123, "username": "aldita", "firstName": "Aldita", "lastName": "Nurrahmadiani", "email": "aldita@email.com", "password": "password123", "phone": "0987654321", "userStatus": 1}
    When url "https://petstore.swagger.io/v2/user"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Get User by Username
    When url "https://petstore.swagger.io/v2/user/aldita"
    And method get
    Then print response
    And status 200

  Scenario: Login
    When url "https://petstore.swagger.io/v2/user/login?username=aldita&password=password123"
    And method get
    Then print response
    And status 200

  Scenario: Updated User
    * def reqBody = {"id": 123, "username": "alditanr", "firstName": "Aldita", "lastName": "Nurrahmadiani", "email": "aldita@email.com", "password": "password123", "phone": "0987654321", "userStatus": 0}
    When url "https://petstore.swagger.io/v2/user/aldita"
    And request reqBody
    And method put
    Then print response
    And status 200

  Scenario: Logout
    When url "https://petstore.swagger.io/v2/user/logout"
    And method get
    Then print response
    And status 200