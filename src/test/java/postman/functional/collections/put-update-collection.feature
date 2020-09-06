@Functional @Collections @PutUpdateCollection @CS5
Feature: update a collection

  Background: set the url and api key used in the request and create a new test collection
    * url baseUrl
    * configure headers = { X-Api-Key: #(apiKey) }
    * path 'collections'
    * request read('collections.json').create
    * method post
    * status 200
    * def uid = response.collection.uid
    * def id = response.collection.id
    * def payload = read('collections.json').update
    * set payload._postman_id = id
    * def name = payload.collection.info.name

    Scenario: update an existing collection
      Given path 'collections', uid
      And request payload
      When method put
      Then status 200
      And match response == { collection: { id: '#(id)', name: '#(name)', uid: '#(uid)' } }

      # after - delete collection
      * path 'collections', uid
      * method delete
      * status 200
