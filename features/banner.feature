# @licence GNU GPL v2+
# @author Christoph Fischer

Feature: Banner visibility checks for Wikipedia

  Background:

  Scenario Outline: Checks if a given banner is live
    When I am on a random Wikipedia article page
    Then The <given_banner_id> should be present

  Examples:
    | given_banner_id |
    | B14_WMDE_140918_switch |

  Scenario Outline: Checks if a given banner is available
    When I am on a random Wikipedia article page and provide a <banner_code>
    Then The <given_banner_id> should be present

  Examples:
    | given_banner_id | banner_code |
    | B14_WMDE_140918_ctrl | B14_WMDE_140918_ctrl |
    | B14_WMDE_140918_switch | B14_WMDE_140918_switch |


  Scenario Outline: Checks if a given banner shows after a given time
    When I am on a random Wikipedia article page and provide a <banner_code>
    And I start a timer
    Then The <given_banner_id> should become visible
    And The timer should not exceed the <time_limit>

  Examples:
    | given_banner_id | banner_code | time_limit |
    | B14_WMDE_140918_switch | B14_WMDE_140918_switch | 8 |