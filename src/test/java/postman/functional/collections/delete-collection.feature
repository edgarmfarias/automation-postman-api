@Functional @Collections @DeleteCollection @CS4
Feature: delete a collection

  Background: set the url and api key used in the request and create a new test collection
    * url baseUrl
    * configure headers = { X-Api-Key: #(apiKey) }
    * path 'collections'
    * request read('collections.json').create
    * method post
    * status 200
    * def uid = response.collection.uid
    * def id = response.collection.id

  Scenario: retrieve single collection
    Given path 'collections', uid
    When method delete
    Then status 200
    And match response == { collection: { id: '#(id)', uid: '#(uid)' } }
