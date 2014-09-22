# @licence GNU GPL v2+
# @author Christoph Fischer

Feature: Check sticky functionality in banners for Wikipedia

  Background:

  Scenario Outline: Checks if a given banner is sticky
    When I am on a long Wikipedia article page and provide a <banner_code>
    And The <given_banner_id> should become visible
    And I wait a second
    And The <given_banner_id> has a concrete position on the Y-axis
    And I scroll to the footer
    Then The <given_banner_id> should move its position on the Y-axis downwards

  Examples:
    | given_banner_id | banner_code |
    | B14_WMDE_140918_ctrl | B14_WMDE_140918_ctrl |


  Scenario Outline: Checks if a given sticky banner can be disabled
    When I am on a long Wikipedia article page and provide a <banner_code>
    And The <given_banner_id> should become visible
    And I wait a second
    And I click the <close_button> element
    Then The <given_banner_id> should hide

  Examples:
    | given_banner_id | banner_code | close_button |
    | B14_WMDE_140918_ctrl | B14_WMDE_140918_ctrl |B14_WMDE_140918_ctrl-close |