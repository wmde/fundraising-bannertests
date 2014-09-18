
Feature: Check form functionality in banners for Wikipedia

  Background:

  Scenario Outline: Checks if the form switches the interval options
    When I am on a long Wikipedia article page and provide a <banner_code>
    And The <given_banner_id> should become visible
    And I wait a second
    And I click the regularly interval option
    Then Regularly details shows

  Examples:
    | given_banner_id | banner_code |
    | B13_WMDE_131230_pbar_cd3 | B13_WMDE_131230_pbar_cd3 |


  Scenario Outline: Checks if the form submits correctly
    When I am on a long Wikipedia article page and provide a <banner_code>
    And The <given_banner_id> should become visible
    And I wait a second
    And I click the <given_banner_id> deposit option
    Then The fundraising frontend shows
    And The deposit option should be selected

  Examples:
    | given_banner_id | banner_code |
    | B13_WMDE_131230_pbar_cd3 | B13_WMDE_131230_pbar_cd3 |