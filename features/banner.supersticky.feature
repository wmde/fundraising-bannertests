# @licence GNU GPL v2+
# @author Christoph Fischer

Feature: Check super-sticky functionality in banners for Wikipedia

  Background:

  Scenario Outline: Checks if a given banner is super-sticky
    When I am on a long Wikipedia article page and provide a <banner_code>
    And The <banner_div_id> should become visible
    And I wait a second
    And The <banner_div_id> has a concrete position on the Y-axis
    And I scroll to the footer
    Then The <banner_div_id> should have the same position on the Y-axis
    And The <sticky_div_id> should become visible

  Examples:
    | banner_code | banner_div_id | sticky_div_id |
    | B14_WMDE_140918_switch | B14_WMDE_140918_switch | B14_WMDE_140918_switch-nag |


  Scenario Outline: Checks if a given super-sticky banner can be closed
    When I am on a long Wikipedia article page and provide a <banner_code>
    And The <banner_div_id> should become visible
    And I wait a second
    And I click the <close_button_id> element
    Then The <banner_div_id> should hide

  Examples:
    | banner_code | banner_div_id | close_button_id |
    | B14_WMDE_140918_switch | B14_WMDE_140918_switch | B14_WMDE_140918_switch-close |


  Scenario Outline: Checks if a given super-sticky banner can be closed
    When I am on a long Wikipedia article page and provide a <banner_code>
    And The <banner_div_id> should become visible
    And I scroll to the footer
    And The <sticky_div_id> should become visible
    And I wait a second
    And I click the <sticky_close_button_id> element span
    Then The <sticky_div_id> should hide

  Examples:
    | banner_code | banner_div_id | sticky_div_id | sticky_close_button_id |
    | B14_WMDE_140918_switch | B14_WMDE_140918_switch | B14_WMDE_140918_switch-nag | B14_WMDE_140918_switch-nag-close |
