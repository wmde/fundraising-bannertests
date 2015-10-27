# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising donation functionality in the sensitive banner for Wikipedia

  Background:
    When I am on a random Wikipedia article page and provide a B15WMDE_sensitive
    And WMDE_BannerFullForm becomes visible

  Scenario Outline: Checks the deposit donation method and confirmation
    When I click sensitive banner deposit option
    And I click the banner <amount> amount option
    And I enter sensitive address data
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