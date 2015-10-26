# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising ui functionality in the sensitive banner for Wikipedia

  Background:
    When I am on a random Wikipedia article page and provide a B15WMDE_sensitive

  Scenario: Checks if the banner shows
    Then The WMDE_BannerFullForm should become visible

  Scenario: Checks if the form switches the interval options
    When WMDE_BannerFullForm becomes visible
    And I click the regularly interval option
    Then Regularly details shows

  Scenario: Checks if the deposit payment method opens correctly
    When WMDE_BannerFullForm becomes visible
    And I click sensitive banner debit option
    Then The sepa donation part should be visible
    Then The nonsepa donation part should not be visible
    Then The person donation part should be visible
    Then The company donation part should not be visible
    Then The address donation part should be visible
    Then The next button should be visible
    Then The finish donation button should not be visible

  Scenario Outline: Checks if the non-deposit payment methods open correctly
    When WMDE_BannerFullForm becomes visible
    And I click sensitive banner <payment_method> option
    Then The sepa donation part should not be visible
    Then The nonsepa donation part should not be visible
    Then The person donation part should be visible
    Then The company donation part should not be visible
    Then The address donation part should be visible
    Then The next button should not be visible
    Then The finish donation button should be visible

  Examples:
    | payment_method |
    | deposit |
    | credit |
    | paypal |
