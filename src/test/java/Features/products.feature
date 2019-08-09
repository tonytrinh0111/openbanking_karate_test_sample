Feature: Products

  Background:
    * url baseUrl

  @positive
  Scenario: obtain a list of products that are currently openly offered to the market
    Given path 'banking/products'
    When method get
    Then status 200
    * def products = response.data.products
    And match products[0].productId == 'productId'


  @positive
  Scenario: obtain detailed information on a single product offered openly to the market
    Given path 'banking/products'
    When method get
    Then status 200
    * def productId = response.data.products[0].productId


    Given path 'banking/products'
    And path productId
    When method get
    Then status 200
    And match response.links.self == 'self'

