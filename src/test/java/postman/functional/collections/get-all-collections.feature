@Functional @Collections @GetAllCollections @CS1
Feature: retrieve all collections related to give API key

  Background: set the url and api key used in the requests
    * url baseUrl
    * configure headers = { X-Api-Key: #(apiKey) }

    Scenario: retrieve all collections
      Given path 'collections'
      When method get
      Then status 200
      And match response == { collections: '#[2] #object' }
      And match response contains deep { collections: [ { name: 'Foursquare Places API' }, { name: 'Twitter API v2'} ] }
      And match each response.collections ==
      """
      {
        id: '#uuid',
        name: '#string',
        owner: '#string',
        uid: '#(_$.owner + '-' + _$.id)'
      }
      """
