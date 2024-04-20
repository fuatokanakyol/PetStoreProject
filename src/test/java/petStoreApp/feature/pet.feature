Feature:
  Background:
Given url apiUrl
    * def petRequestBody = read('classpath:petStoreApp/json/newPetRequest.json')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomPetValues = dataGenerator.getRandomPetValues()
    * set petRequestBody.id = randomPetValues.id
    * set petRequestBody.name = randomPetValues.name
    * set petRequestBody.categoryId = randomPetValues.category.id
    * set petRequestBody.categoryName = randomPetValues.category.name
    * set petRequestBody.photoUrls = randomPetValues.photoUrls
    * def petId = randomPetValues.id
    * print petId

  Scenario: add a new pet to store
      Given path "/pet"
      And request petRequestBody
      When method Post
      Then status 200
      * print response
      And match response.name == petRequestBody.name
      
     Scenario: Check pet with id
       Given path "/pet"
       And request petRequestBody
       When method Post
       Then status 200
       Given path "/pet/" + petId
       When method Get
       Then status 200
       * print response

       And match response.name == petRequestBody.name

  Scenario: update pet name and verify

    Given path "/pet"
    And request petRequestBody
    When method Post
    Then status 200
    * print response
    And match response.name == petRequestBody.name


    Given path "/pet"
    And request {"id": "#(petId)","name": "UpdatedPetName"}

    When method Put
    Then status 200
    * print response
    And match response.name != petRequestBody.name



 Scenario: Find pet By id

   Given path "/pet"
   And request petRequestBody
   When method Post
   Then status 200
   * print response
   And match response.name == petRequestBody.name

   Given path "/pet/" + petId

   When method Get
   Then status 200
   * print response

   Scenario: Delete and Check pet

     Given path "/pet"
     And request petRequestBody
     When method Post
     Then status 200
     * print response
     And match response.name == petRequestBody.name

     Given path "/pet/" + petId

     When method Delete
     Then status 200
     * print response


     Given path "/pet/" + petId

     When method Get
     Then status 404
     * print response
     And match response.message == "Pet not found"

