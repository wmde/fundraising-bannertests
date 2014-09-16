
Feature: Check form functionality in banners for Wikipedia

  Background:

 Scenario Outline: Checks if a given banner with form will be submitted correctly
    When I am on a long Wikipedia article page and provide a B13_WMDE_131228_d75
    And The B13_WMDE_131228_d75 should become visible
    And I wait a second
    And I click the <close_button>
    Then The <given_banner_id> should hide

  Examples:
    | given_banner_id | banner_code | close_button |
    | B13_WMDE_131228_d75 | B13_WMDE_131228_d75 | B13_WMDE_131228_d75-close |