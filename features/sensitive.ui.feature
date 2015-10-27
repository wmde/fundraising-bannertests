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

  Scenario: Checks if the debit payment method opens correctly
    When WMDE_BannerFullForm becomes visible
    And I click sensitive banner debit option
    Then The sepa donation part should be visible
    And The nonsepa donation part should not be visible
    And The person donation part should be visible
    And The company donation part should not be visible
    And The address donation part should be visible
    And The next button should be visible
    And The finish donation button should not be visible

  Scenario Outline: Checks if the non-debit payment methods open correctly
    When WMDE_BannerFullForm becomes visible
    And I click sensitive banner <payment_method> option
    Then The sepa donation part should not be visible
    And The nonsepa donation part should not be visible
    And The person donation part should be visible
    And The company donation part should not be visible
    And The address donation part should be visible
    And The next button should not be visible
    And The finish donation button should be visible

  Examples:
    | payment_method |
    | deposit |
    | credit |
    | paypal |

  Scenario: Checks if the non-sepa payment method opens correctly
    When WMDE_BannerFullForm becomes visible
    And I click sensitive banner debit option
    And I click on the nonsepa payment option
    Then The nonsepa donation part should be visible
    And The sepa donation part should not be visible

  Scenario: Checks if the company from field opens correctly
    When WMDE_BannerFullForm becomes visible
    And I click sensitive banner debit option
    And I click the business address type option
    Then The company donation part should be visible
    And The person donation part should not be visible

  Scenario: Checks if the anonymous from field works correctly
    When WMDE_BannerFullForm becomes visible
    And I click sensitive banner deposit option
    And I click the anonymous address type option
    Then The company donation part should not be visible
    And The person donation part should not be visible
    And The address donation part should not be visible
    And The sepa donation part should not be visible
    And The nonsepa donation part should not be visible

  Scenario: Checks if the anonymous clears fields correctly
    When WMDE_BannerFullForm becomes visible
    And I click sensitive banner deposit option
    And I enter sensitive private address data
    And I click the anonymous address type option
    Then The sensitive private address data should be cleared

  Scenario: Checks if switching the payment method clears fields correctly
    When WMDE_BannerFullForm becomes visible
    And I click sensitive banner debit option
    And I enter valid sepa bank data
    And I click sensitive banner deposit option
    And I click sensitive banner debit option
    Then The bank data cleared