# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check sticky functionality in banners for Wikipedia

  Background:

  Scenario Outline: Checks if a given banner is sticky
    When I am on a long Wikipedia article page and provide a <banner_code>
    And The <banner_div_id> should become visible
    And I wait a second
    And The <banner_div_id> has a concrete position on the Y-axis
    And I scroll to the footer
    Then The <banner_div_id> should move its position on the Y-axis downwards

  Examples:
    | banner_code | banner_div_id |
    | B14_WMDE_140918_ctrl | B14_WMDE_140918_ctrl |


  Scenario Outline: Checks if a given sticky banner can be closed
    When I am on a random Wikipedia article page and provide a <banner_code>
    And The <banner_div_id> should become visible
    And I wait a second
    And I click the <close_button_id> element
    Then The <banner_div_id> should hide

  Examples:
    | banner_code | banner_div_id | close_button_id |
    | B14_WMDE_140918_ctrl | B14_WMDE_140918_ctrl | B14_WMDE_140918_ctrl-close |