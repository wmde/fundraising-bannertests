# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising donation functionality in the sensitive banner for Wikipedia

  Background:
    When I am on a random Wikipedia article page and provide a B15WMDE_sensitive
    And WMDE_BannerFullForm becomes visible

  Scenario Outline: Checks the deposit donation method and confirmation
    When I click sensitive banner deposit option
    And I click the banner <amount> amount option
    And I enter sensitive private address data
    And I submit the sensitive banner non-debit form by clicking the submit button
    Then The deposit confirmation page shows
    And The confirmed amount should be <result_amount>

    Examples:
      | amount | result_amount |
#      | amount5 | 5,00 |
#      | amount15 | 15,00 |
#      | amount25 | 25,00 |
#      | amount50 | 50,00 |
#      | amount75 | 75,00 |
      | amount100 | 100,00 |
      | amount250 | 250,00 |

  Scenario: Checks the credit card donation method
    When I click sensitive banner credit option
    And I click the banner amount100 amount option
    And I enter sensitive private address data
    And I submit the sensitive banner non-debit form by clicking the submit button
    Then The credit confirmation page shows
    And The 100 amount value should show
    And The cardholder should be the surname and name

  Scenario: Checks the paypal donation method
    When I click sensitive banner paypal option
    And I click the banner amount100 amount option
    And I enter sensitive private address data
    And I submit the sensitive banner non-debit form by clicking the submit button
    Then The paypal form shows
    And The paypal donation amount should show 100,00 Euro

  Scenario Outline: Checks the paypal donation method and confirmation
    When I click sensitive banner paypal option
    And I click the banner amount100 amount option
    And I click the <address_type> address type option
    And I enter sensitive <address_type> address data
    And I submit the sensitive banner non-debit form by clicking the submit button
    And I login with my paypal credentials
    And I click on the paypal continue button
    And I click on the paypal back button
    Then The normal donation confirmation shows
    And The sensitive <address_type> address data on the confirmation page should be the same

    Examples:
      | address_type |
      | private |
      | business |

  Scenario Outline: Checks the debit donation method secound step
    When I click sensitive banner debit option
    And I click the banner amount100 amount option
    And I enter valid sepa bank data
    And I click the <address_type> address type option
    And I enter sensitive <address_type> address data
    And I submit the sensitive banner debit form by clicking the submit button
    Then The debit secound step should be visible
    And The debit first step should not be visible
    And The finish sepa donation button should be visible
    And The company donation part should not be visible
    And The person donation part should not be visible
    And The address donation part should not be visible
    And The sepa donation part should not be visible
    And The nonsepa donation part should not be visible
    And The debit donation amount should show 100 Euro
    And The sensitive <address_type> address data on the debit secound step should be the same

  Examples:
    | address_type |
    | private |
    | business |

  Scenario Outline: Checks the debit donation method and final confirmation
    When I click sensitive banner debit option
    And I click the banner amount100 amount option
    And I enter valid sepa bank data
    And I click the <address_type> address type option
    And I enter sensitive <address_type> address data
    And I submit the sensitive banner debit form by clicking the submit button
    And I confirm the debit contract
    And I confirm the notification contract
    And I finish the sensitive banner debit form by clicking the submit button
    Then The debit donation confirmation shows
    And The sensitive <address_type> address data on the confirmation page should be the same

    Examples:
      | address_type |
      | private |
      | business |