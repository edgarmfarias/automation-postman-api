@functional @accounts @getAccounts
Feature: get accounts

  Background: set the url and authorization token used in the requests
    * url baseUrl
    * configure headers = { Authorization: #(authorizationToken) }

    Scenario: verify that the response schema is correct when retrieving accounts
      Given path 'accounts'
      When method get
      Then status 200
      And match responseType == 'json'
      And match response == { data: '#[] #string' }
