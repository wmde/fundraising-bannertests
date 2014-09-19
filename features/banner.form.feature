# @licence GNU GPL v2+
# @author Christoph Fischer

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


  Scenario Outline: Checks if the form submits the payment method correctly
    When I am on a random Wikipedia article page and provide a B13_WMDE_131230_pbar_cd3
    And The B13_WMDE_131230_pbar_cd3 should become visible
    And I wait a second
    And I click the B13_WMDE_131230_pbar_cd3 banner <payment_method> option
    Then The fundraising frontend shows
    And The <payment_method> option should be selected

  Examples:
    | payment_method |
    | deposit |
    | debit |
    | credit |
    | paypal |


  Scenario Outline: Checks if the form submits the selectable amount correctly
    When I am on a random Wikipedia article page and provide a B13_WMDE_131230_pbar_cd3
    And The B13_WMDE_131230_pbar_cd3 should become visible
    And I wait a second
    And I click the banner <amount> amount option
    And I click the B13_WMDE_131230_pbar_cd3 banner deposit option
    Then The fundraising frontend shows
    And The <amount> amount should be selected

  Examples:
    | amount |
    | amount5 |
    | amount15 |
    | amount25 |
    | amount50 |
    | amount75 |
    | amount100 |
    | amount250 |


  Scenario: Checks if the form submits the free field amount correctly
    When I am on a random Wikipedia article page and provide a B13_WMDE_131230_pbar_cd3
    And The B13_WMDE_131230_pbar_cd3 should become visible
    And I wait a second
    And I enter an random valid amount
    And I click the B13_WMDE_131230_pbar_cd3 banner deposit option
    Then The fundraising frontend shows
    And The given amount should show