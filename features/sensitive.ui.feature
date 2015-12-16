# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising ui functionality in the sensitive banner for Wikipedia

  Background:
    When I am on a random Wikipedia article page and provide a B15WMDE_sensitive

  Scenario: Checks if the banner shows
    Then The WMDE_BannerFullForm banner container should be visible

  Scenario: Checks if the banner can be closed
    When The WMDE_Banner banner container is visible
    And I reset the hide banner cookie centralnotice_wmde15_hide_cookie
    And I click the banner close button
    Then The WMDE_Banner banner should not be visible
    And The hide banner cookie centralnotice_wmde15_hide_cookie should be set

  Scenario: Checks if the form switches the interval options
    When The WMDE_BannerFullForm banner container is visible
    And I click the regularly interval option
    Then The regularly details shows

  Scenario: Checks if the debit payment method opens correctly
    When The WMDE_BannerFullForm banner container is visible
    And I click sensitive banner debit option
    Then The sepa donation part should be visible
    And The nonsepa donation part should not be visible
    And The person donation part should be visible
    And The company donation part should not be visible
    And The address donation part should be visible
    And The next button should be visible
    And The finish donation button should not be visible

  Scenario Outline: Checks if the non-debit payment methods open correctly
    When The WMDE_BannerFullForm banner container is visible
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
    When The WMDE_BannerFullForm banner container is visible
    And I click sensitive banner debit option
    And I click on the nonsepa payment option
    Then The nonsepa donation part should be visible
    And The sepa donation part should not be visible

  Scenario: Checks if the company from field opens correctly
    When The WMDE_BannerFullForm banner container is visible
    And I click sensitive banner debit option
    And I click the business address type option
    Then The company donation part should be visible
    And The person donation part should not be visible

  Scenario: Checks if the anonymous from field works correctly
    When The WMDE_BannerFullForm banner container is visible
    And I click sensitive banner deposit option
    And I click the anonymous address type option
    Then The company donation part should not be visible
    And The person donation part should not be visible
    And The address donation part should not be visible
    And The sepa donation part should not be visible
    And The nonsepa donation part should not be visible

  Scenario: Checks if the anonymous clears fields correctly
    When The WMDE_BannerFullForm banner container is visible
    And I click sensitive banner deposit option
    And I enter sensitive private address data
    And I click the anonymous address type option
    Then The sensitive private address data should be cleared

  Scenario: Checks if switching the payment method clears fields correctly
    When The WMDE_BannerFullForm banner container is visible
    And I click sensitive banner debit option
    And I enter valid sepa bank data
    And I click sensitive banner deposit option
    And I click sensitive banner debit option
    Then The bank data cleared