# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising validation functionality in the sensitive banner for Wikipedia

  Background:
    When I am on a random Wikipedia article page and provide a B15WMDE_sensitive
    And WMDE_BannerFullForm becomes visible

  Scenario Outline: Checks if the form validation accepts valid address data
    When I click sensitive banner deposit option
    And I enter sensitive address data
    And I submit the sensitive banner deposit form by <submit_type>
    Then The fundraising frontend shows

    Examples:
      | submit_type |
      | clicking the submit button |
      | pressing the enter key |

  Scenario Outline: Checks if the form validation complains with incomplete address data
    When I click sensitive banner deposit option
    And I enter sensitive address data
    And I remove the <field> address data
    And I submit the sensitive banner deposit form by clicking the submit button
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
    And I enter sensitive address data
    And I enter an invalid email
    And I submit the sensitive banner deposit form by clicking the submit button
    Then The address donation part should be visible
    And An email error should show
    And An first-name error should not show