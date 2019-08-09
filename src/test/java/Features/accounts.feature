Feature: Accounts

  Background:
    * url baseUrl

  @positive
  Scenario: Obtain a list of accounts
    Given path 'banking/accounts'
    And param open-status = 'ALL'
    And param page = 1
    And param page-size = 25
    When method get
    Then status 200
    * def accounts = response.data.accounts
    And match accounts[0].accountId == 'accountId'
    And match response.meta.totalPages == 6


  @positive
  Scenario: Obtain balances for multiple, filtered accounts
    Given path 'banking/accounts/balances'
    And param open-status = 'ALL'
    And param page = 1
    And param page-size = 25
    When method get
    Then status 200
    * def balances = response.data.balances
    And match balances[0].currentBalance == 'currentBalance'

  @positive
  Scenario: Obtain balances for a specified list of accounts
    * def accountIdRequest =
      """
      {
        "data": {"accountIds": ["accountId1","accountId1"]},
        "meta": {}
      }
      """

    Given path 'banking/accounts/balances'
    And request accountIdRequest
    And param page = 1
    And param page-size = 25
    When method post
    Then status 200
    * def balances = response.data.balances
    And match balances[0].currentBalance == 'currentBalance'

