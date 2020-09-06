@Functional @Collections @PostCreateCollection @CS3
Feature: create a new collection

  Background: set the url and api key used in the request
    * url baseUrl
    * configure headers = { X-Api-Key: #(apiKey) }
    * def payload = read('collections.json').create

    Scenario: create a new collection given a payload
      Given path 'collections'
      And request payload
      When method post
      Then status 200
      And match response == { collection: { id: '#uuid', name: '#(payload.collection.info.name)', uid: '#string' } }

      # after - delete collection
      * path 'collections', response.collection.uid
      * method delete
      * status 200
