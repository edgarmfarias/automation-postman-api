@functional @accounts @postBulkNotifications
Feature: get accounts

  Background: set the url and authorization token used in the requests
    * url baseUrl
    * configure headers = { Authorization: #(authorizationToken) }
    * def bulkNotificationPath = 'accounts/staging/bots/fake/notifications'
    * def payload =       
      """
      {
         "type": "generic-not",
         "users": [
            {
               "phone": "+525531974734",
               "params": {
                  "message": "Test message"
               }
            }
         ]
      }
      """

    @successful
    Scenario: verify that the response is successful when posting a bulk notification
      Given path bulkNotificationPath
      And request payload
      When method post
      Then status 201
      And match responseType == 'json'
      And match response == { success: true }

   @unsuccessful @badRequest
   Scenario: verify that the response is unsuccessful when posting an invalid bulk notification type
      Given path bulkNotificationPath
      And payload.type = 'invalid'
      And request payload
      When method post
      Then status 400
      And match responseType == 'json'
      And match response == { success: false }
