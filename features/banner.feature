
Feature: Banner visibility checks for Wikipedia

  Background:

  Scenario Outline: Checks if a given banner is present
    When I am on a random Wikipedia article page
    Then The <given_banner_id> should be present

  Examples:
    | given_banner_id |
    | wlm-banner |
    | B13_WMDE_131228_d75 |

  Scenario Outline: Checks if a given banner is available
    When I am on a random Wikipedia article page and provide a <banner_code>
    Then The <given_banner_id> should be present

  Examples:
    | given_banner_id | banner_code |
    | wlm-banner | wlm_2014 |
    | B13_WMDE_131228_d75 | B13_WMDE_131228_d75 |


  Scenario Outline: Checks if a given banner shows after a given time
    When I am on a random Wikipedia article page and provide a <banner_code>
    And I start a timer
    Then The <given_banner_id> should become visible
    And The timer should not exceed the <time_limit>

  Examples:
    | given_banner_id | banner_code | time_limit |
    | B13_WMDE_131228_d75 | B13_WMDE_131228_d75 | 8 |
    | wlm-banner | wlm_2014 | 1 |


  Scenario Outline: Checks if a given banner is sticky
    When I am on a long Wikipedia article page and provide a <banner_code>
    And The <given_banner_id> should become visible
    And I wait a second
    And The <given_banner_id> has a concrete position on the Y-axis
    And I scroll to the footer
    Then The <given_banner_id> should move its position on the Y-axis downwards

  Examples:
    | given_banner_id | banner_code |
    | wlm-banner | wlm_2014 |
    | B13_WMDE_131228_d75 | B13_WMDE_131228_d75 |


  Scenario Outline: Checks if a given sticky banner can be disabled
    When I am on a long Wikipedia article page and provide a <banner_code>
    And The <given_banner_id> should become visible
    And I wait a second
    And I click the <close_button> element
    Then The <given_banner_id> should hide

  Examples:
    | given_banner_id | banner_code | close_button |
    | B13_WMDE_131228_d75 | B13_WMDE_131228_d75 | B13_WMDE_131228_d75-close |