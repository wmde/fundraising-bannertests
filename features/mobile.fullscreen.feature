# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising mobile fullscreen banners for Wikipedia

  Background:

  Scenario Outline: Checks if the form submits the selectable amount correctly
    When I am on a random mobile Wikipedia article page and provide a B14WMDE_mobile_prototype
    And The B14WMDE_mobile_prototype banner container is visible
    And I wait a second
    And I click the banner <amount> amount option
    And I click the B14WMDE_mobile_prototype mobilebanner credit option
    Then The fundraising frontend shows
    And The <amount_value> amount value should show

  Examples:
    | amount | amount_value |
    | amount1 | 5           |
    | amount2 | 15          |
    | amount3 | 25          |
    | amount4 | 50          |
    | amount5 | 75          |
    | amount6 | 100         |

  Scenario: Checks if the form submits paypal correctly
    When I am on a random mobile Wikipedia article page and provide a B14WMDE_mobile_prototype
    And The B14WMDE_mobile_prototype banner container is visible
    And I wait a second
    And I click the banner amount1 amount option
    And I click the B14WMDE_mobile_prototype mobilebanner paypal option
    Then The paypal donation page shows