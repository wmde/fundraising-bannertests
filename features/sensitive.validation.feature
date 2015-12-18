# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising validation functionality in the sensitive banner for Wikipedia

  Background:
    When I am on a random Wikipedia article page and provide a B15WMDE_sensitive
    And The WMDE_BannerFullForm banner container is visible
    And I click the banner amount5 amount option

  Scenario Outline: Checks if the form validation accepts valid address data
    When I click sensitive banner deposit option
    And I enter sensitive private address data
    And I submit the sensitive banner non-debit form by <submit_type>
    Then The fundraising frontend shows

    Examples:
      | submit_type |
      | clicking the submit button |
      | pressing the enter key |

  Scenario Outline: Checks if the form validation complains with incomplete address data
    When I click sensitive banner deposit option
    And I enter sensitive private address data
    And I remove the <field> address data
    And I submit the sensitive banner non-debit form by clicking the submit button
    Then The address donation part should be visible
    And An <field> error should show

    Examples:
      | field |
      | first-name |
      | last-name |
      | street |
      | post-code |
      | city |
      | email |

  Scenario: Checks if the form validation complains with invalid email
    When I click sensitive banner deposit option
    And I enter sensitive private address data
    And I enter an invalid email
    And I submit the sensitive banner non-debit form by clicking the submit button
    Then The address donation part should be visible
    And An email error should show
    And An first-name error should not show

  Scenario: Checks if the form validation complains with invalid postcode
    When I click sensitive banner deposit option
    And I enter sensitive private address data
    And I enter an invalid post-code
    And I submit the sensitive banner non-debit form by clicking the submit button
    Then The address donation part should be visible
    And An post-code error should show
    And An first-name error should not show

  Scenario: Checks if the form validation complains with invalid sepa bank data
    When I click sensitive banner debit option
    And I enter invalid sepa bank data
    And I enter sensitive private address data
    And I submit the sensitive banner debit form by clicking the submit button
    Then The address donation part should be visible
    And An iban error should show
    And An first-name error should not show

  Scenario: Checks if the form validation complains with invalid non-sepa bank data
    When I click sensitive banner debit option
    And I click on the nonsepa payment option
    And I enter invalid non-sepa bank data
    And I enter sensitive private address data
    And I submit the sensitive banner debit form by clicking the submit button
    Then The address donation part should be visible
    And An account-number error should show
    And An first-name error should not show

  Scenario: Checks if the form validation converts german account data correctly
    When I click sensitive banner debit option
    And I click on the nonsepa payment option
    And I enter valid non-sepa bank data
    And I enter sensitive private address data
    Then The sepa bank data should be filled with corresponding data
