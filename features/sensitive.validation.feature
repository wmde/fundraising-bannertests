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
