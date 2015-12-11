# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising form functionality in banners for Wikipedia

  Background:

  Scenario Outline: Checks if the form switches the interval options
    When I am on a random Wikipedia article page and provide a <banner_code>
    And The <banner_div_id> should become visible
    And I click the regularly interval option
    Then The regularly details shows

  Examples:
    | banner_code | banner_div_id |
    | B14_WMDE_140918_switch | B14_WMDE_140918_switch |


  Scenario Outline: Checks if the form submits the payment method correctly
    When I am on a random Wikipedia article page and provide a B14_WMDE_140918_switch
    And The B14_WMDE_140918_switch should become visible
    And I wait a second
    And I click the banner <payment_method> option
    Then The fundraising frontend shows
    And The <payment_method> option should be selected

  Examples:
    | payment_method |
    | deposit |
    | debit |
    | credit |
    | paypal |


  Scenario Outline: Checks if the form submits the selectable amount correctly
    When I am on a random Wikipedia article page and provide a B14_WMDE_140918_switch
    And The B14_WMDE_140918_switch should become visible
    And I wait a second
    And I click the banner <amount> amount option
    And I click the banner deposit option
    Then The fundraising frontend shows
    And The <amount> amount should be selected

  Examples:
    | amount |
    | amount5 |
    | amount15 |
    | amount25 |
    | amount50 |
    | amount75 |
    | amount100 |
    | amount250 |


  Scenario: Checks if the form submits the free field amount correctly
    When I am on a random Wikipedia article page and provide a B14_WMDE_140918_switch
    And The B14_WMDE_140918_switch should become visible
    And I wait a second
    And I enter an random valid amount
    And I click the banner deposit option
    Then The fundraising frontend shows
    And The given amount should show