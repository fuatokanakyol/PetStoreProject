Feature: Users
  Background:
    Given url apiUrl
    * def userRequestBody = read('classpath:petStoreApp/json/newUserRequest.json')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomUserValues = dataGenerator.getRandomUserValues()
    * set userRequestBody.id = randomUserValues.id
    * set userRequestBody.userStatus = randomUserValues.userStatus
    * set userRequestBody.username = randomUserValues.username
    * set userRequestBody.firstName = randomUserValues.firstName
    * set userRequestBody.lastName = randomUserValues.lastName
    * set userRequestBody.email = randomUserValues.email
    * set userRequestBody.password = randomUserValues.password
    * set userRequestBody.phone = randomUserValues.phone

    * print userRequestBody
    * def userName = userRequestBody.username

  Scenario:Create a new user with list
    Given path "/user"
    And request userRequestBody
    When method Post
    Then status 200
    And match response.code == 200

  Scenario: check user by username

    Given path "/user"
    And request userRequestBody
    When method Post
    Then status 200
    And match response.code == 200
    * print response
    * print userRequestBody


    Given path '/user/' + userName
    When method Get
    Then status 200
    And match response.username == userName

  Scenario: User login

    Given path "/user"
    And request userRequestBody
    When method Post
    Then status 200
    And match response.code == 200
    * print response
    * print userRequestBody

    Given path "/user/login"
    Given params { username: #(userRequestBody.username) ,password: #(userRequestBody.password)}

    When method Get
    Then status 200
    And match response.message contains "logged in user session:"


  Scenario: Update User Info

    Given path "/user"
    And request userRequestBody
    When method Post
    Then status 200
    And match response.code == 200
    * print response
    * print userRequestBody


    Given path '/user/' + userName
    And request {"username": "UpdatedUserName"}
    When method Put
    Then status 200
    And match response.code == 200

    Given path '/user/UpdatedUserName'
    When method Get
    Then status 200
    * print response
    And match response.username != userRequestBody.username
    
    
    Scenario: User Logout 
      Given path '/user/logout'
      When method Get
      Then status 200
      And match response.message == 'ok'
