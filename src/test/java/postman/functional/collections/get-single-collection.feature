@Functional @Collections @GetSingleCollection @CS2
Feature: retrieve single collection given a uid

  Background: set the url and api key used in the requests and get an uid
    * url baseUrl
    * configure headers = { X-Api-Key: #(apiKey) }
    * path 'collections'
    * method get
    * status 200
    * def uid = response.collections[0].uid
    * def name = response.collections[0].name

    Scenario: retrieve single collection
      Given path 'collections', uid
      When method get
      Then status 200
      And match response ==  { collection: { info: '#object', item: '#[] #object' } }
      And match response.collection.info ==
      """
      {
        _postman_id: '#uuid',
        name: '#(name)',
        description: '#string',
        schema: '#regex http.+json$'
      }
      """
      And match each response.collection.item contains
      """
      {
        name: '#string',
        item: '#[]',
        _postman_id: '#uuid'
      }
      """
