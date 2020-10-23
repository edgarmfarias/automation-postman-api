@functional @accounts @getSubscriptionTypes
Feature: get subscription types

  Background: set the url and authorization token used in the requests
    * url baseUrl
    * configure headers = { Authorization: #(authorizationToken) }
    * def timestampRegex = '\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z'

    Scenario: verify that the response schema is correct when retrieving subscription types
      Given path 'accounts/sirena/bots/mc-staging2/subscription-types'
      When method get
      Then status 200
      And match responseType == 'json'
      And match response == { data: '#[] #object' }
      And match each response.data ==
      """
      {
         waba_id: '#string',
         updated_at: '#("#regex " + timestampRegex)',
         name: '#string',
         id: '#regex [a-z0-9]{24}',
         handler: {
            type: '#string'
         },
         description: '#string',
         created_at: '#("#regex " + timestampRegex)',
         channel: '#string',
         bot_slug: '#string',
         account_id: '#string'
      }
      """
